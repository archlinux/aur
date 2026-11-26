# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgauthor=bahdotsh
_pkgname=wrkflw
pkgname=${_pkgname}-bin
pkgdesc="Validate and execute GitHub Actions workflows locally"

pkgver=0.9.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'openssl')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}.tar.gz")
sha256sums=('e8541fc2191c94f95ac8b1f724370fd3c99db0c6bc9f9e3a1689e8f62fbeb2a8'
            'e635a29d3556c9b030c44f42c52aee20aa6d22c0e448003baef320e9dc2e1764')
sha256sums_x86_64=('f96fa5a4dead76eb416a22c939a552f7ef63ed89c799342a8029f36d4c5426c9')
sha256sums_aarch64=('d7f71f5ba3a711d2cfad1a42dc5d24465f093fea6b17b6d1b03390ce5199f47e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
