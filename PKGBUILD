# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ayanchavand
_pkgname=FiTui
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal-based personal finance tracker"

pkgver=1.0.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

source=("README-${_pkgvername}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${_pkgvername}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('a3544d85700b9c673413790c72aa3c456921cc9eb4b7c910c8b5929f8ff8ad47')
sha256sums_x86_64=('a7f10d0dfea55423360b6a55ab0cf159c78f19b90a776cb7971b897ff6e7d71a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${_pkgvername}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
