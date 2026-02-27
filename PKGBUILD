# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ayanchavand
_pkgname=FiTui
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal-based personal finance tracker"

pkgver=0.3.0
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
sha256sums=('b52e8d8211e48a214114fb7e15831d798fff2ece3d45777bc811af466dd7e4a3')
sha256sums_x86_64=('a1a86eac0c4e4ff583d23a41434268ca27edba92c86a4242abdd7cdbe74dcd06')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${_pkgvername}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
