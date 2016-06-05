# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=arc-icon-theme-git
_gitname=arc-icon-theme
pkgver=20160605
pkgrel=1
pkgdesc='Arc icon theme'
arch=(any)
url=https://github.com/horst3180/arc-icon-theme
license=('GPL3')
depends=()
makedepends=('git' 'gnome-common' 'intltool' 'itstool')
source=("git://github.com/horst3180/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr
	make
}

package() {
  	cd "${srcdir}/${_gitname}"
	make install
}