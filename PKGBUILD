# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheKhanj
_pkgname=salsa
pkgname=${_pkgname}-bin
pkgver=0.0.5
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="TCP load balancer proxy with health checks"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}.tar.gz")
sha256sums=('7362543def8c5f14537fc9852ea6b4fc1c13113d247098b5bb0ef0aa9f63828f')
sha256sums_x86_64=('67973bb7951c12c695f2dd2289be978b04e6abb13c333d0cd7ebc45f45c3c7ae')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm755 "${_pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
