# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kriuchkov
_pkgname=tock
pkgname=${_pkgname}-bin
pkgdesc="A powerful time tracking tool for the command line"

pkgver=1.7.2
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

# source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
#         "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_Linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('330fd668d2b4545e7766588f55489f6401cc3badbcbc74db9b3ac7ff89895a1d')
sha256sums_aarch64=('3f5ef1b5d7cdcc97e3e517575a8d2d8f6971eb6a2caf6eeebf7bad28c09554c3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
