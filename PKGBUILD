# Maintainer: Bartłomiej Bułat <bartek (dot) bulat (at) gmail (dot) com>
pkgname=deadbeef-gnome-mmkeys-git
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="DeaDBeeF player Gnome (via DBus) multimedia keys plugin"
arch=(i386 x86_64)
url="https://github.com/barthez/deadbeef-gnome-mmkeys"
license=('GPL')
depends=(deadbeef glib2)
makedepends=(make git)
source=(git+https://github.com/barthez/deadbeef-gnome-mmkeys.git)
md5sums=('SKIP')

pkgver() {
  cd decast
  printf "r""$(git rev-list --count HEAD)"
}


build() {
	cd "$srcdir/deadbeef-gnome-mmkeys"
	make
}

package() {
	cd "$srcdir/deadbeef-gnome-mmkeys"
	make ROOTDIR="$pkgdir/" install
}
