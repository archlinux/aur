# Maintainer: Wali Waqar <waliwaqars@gmail.com>

pkgname=pensela-bin
_pkgver=v1.2.3
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="The Swiss Army Knife of Screen Annotation Tools"
arch=('x86_64')
url="https://github.com/weiameili/Pensela"
license=('ISC')
conflicts=()
depends=('imagemagick')
_filename=pensela-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
sha256sums=('10b30a543017dc0352e8df4ebc4d06167ba3afcb7fe9374dffaff23ad726bbd3')
options=(!strip)

package() {
	tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
	mkdir "$pkgdir/usr/bin"
	ln -s "/opt/Pensela/pensela" "$pkgdir/usr/bin/pensela"
}
