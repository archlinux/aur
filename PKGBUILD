# Maintainer: Srevin Saju <srevin03@gmail.com>

pkgname=sugar-runner-git
pkgver=0.110.0.g
pkgrel=5
pkgdesc="Scripts to run Sugar"
arch=('x86_64')
url="https://sugarlabs.org/"
license=('GPL')
depends=('xorg-xinit' 'xorg-server-xephyr' 'xorg-xrandr')
makedepends=('gobject-introspection')
source=(https://github.com/sugarlabs/sugar-runner/archive/master.zip)
sha256sums=('SKIP')

build() {
  cd sugar-runner-master
  chmod +x ./autogen.sh
  ./autogen.sh --prefix=/usr --with-python3
  make
}

package() {
  cd sugar-runner-master
  make DESTDIR="$pkgdir" install
}
