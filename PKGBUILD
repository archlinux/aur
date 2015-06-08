# Maintainer: willemw <willemw12@gmail.com>

_pkgname=dontwaitup-indicator
pkgname=$_pkgname-bzr
pkgver=r27
pkgrel=1
pkgdesc="Run a command on window event"
url="https://launchpad.net/dontwaitup"
license=('GPL3')
arch=('any')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'libwnck3' 'python2-gobject' 'yelp')
#optdepends=('libnotify: notify-send')
makedepends=('bzr' 'python2-distutils-extra')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
source=($pkgname::bzr+https://code.launchpad.net/~alessandro-blarco/dontwaitup/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}

