# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme
_pkgname=arc-icon-theme
pkgver=20160605
pkgrel=1
pkgdesc='Arc icon theme'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=()
makedepends=('gnome-common' 'intltool' 'itstool' 'unzip')
source=(https://github.com/horst3180/${_pkgname}/archive/${pkgver}.zip)
md5sums=('SKIP')


pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname}/${pkgver}"
	./autogen.sh --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${_pkgname}/${pkgver}"
	make install
}