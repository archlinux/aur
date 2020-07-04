# Maintainer: willemw <willemw12@gmail.com>

pkgname=dontwaitup-indicator-bzr
pkgver=r27
pkgrel=2
pkgdesc="Run a command on window event"
url="https://launchpad.net/dontwaitup"
license=('GPL3')
arch=('any')
depends=('gtk3' 'libappindicator-gtk3' 'libnotify' 'libwnck3' 'python2-gobject' 'yelp')
#optdepends=('libnotify: notify-send')
makedepends=('bzr' 'python-dulwich' 'python2-distutils-extra')
provides=("${pkgname%-bzr}")
conflicts=("${pkgname%-bzr}")
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

