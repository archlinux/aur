# Maintainer: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=yaft-git
pkgver=20140619
pkgrel=1
pkgdesc="yet another framebuffer terminal - git"
url="https://github.com/uobikiemukot/yaft"
license=('MIT')
arch=('i686' 'x86_64')
optdepends=('fbv: needed to set wallpaper')
makedepends=('ncurses')
source=(git+https://github.com/uobikiemukot/yaft.git)
md5sums=('SKIP')

pkgver() {
  cd "yaft"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
	cd "yaft"
	make
}

package() {
	cd "yaft"
	make DESTDIR="$pkgdir" install
}
