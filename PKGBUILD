# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Bengerthelorf
_pkgname=bcmr
pkgname=${_pkgname}-bin
pkgdesc="cp with progress bar"

pkgver=0.3.30
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-linux.tar.gz")
sha256sums=('1a1600e7355b11cc1e69a6a361269e3c9a64f73d6c0b5958fe48f4861053bfd7'
            '0c986149005a7d4d85d760869b1d50f9d8f526d6fc57474910942327589219f3')
sha256sums_x86_64=('24898fbf3f7a1d9b8f33813600f1371068f4cca0f386bdd9439a7f94a7f6feaa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
