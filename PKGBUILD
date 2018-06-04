# Contributor: sickhate <sickhate@tux-linux.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=simdock-git
_repo=simdock
pkgver=1.5.2.r3.g383e9c7
pkgrel=1
pkgdesc="Fast and customizable dockbar"
arch=('i686' 'x86_64')
url="https://github.com/onli/simdock"
license=('GPL2')
depends=('wxgtk3' 'libwnck' 'xcb-util-wm' 'gconf' 'desktop-file-utils')
provides=('simdock')
conflicts=('simdock')
source=("git+https://github.com/onli/simdock.git")
md5sums=('SKIP')

pkgver() {
  cd "${_repo}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_repo}"
  make 
}

package() {
  cd "${_repo}"
  make DESTDIR="$pkgdir" install
  rm -rf $pkgdir/usr/local
}
