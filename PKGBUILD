# Maintainer: willemw <willemw12@gmail.com>

_pkgname=terra
pkgname=$_pkgname-bzr
pkgver=r56
pkgrel=2
pkgdesc="Python/GTK3 drop-down tiling terminal emulator"
arch=('any')
url="https://launchpad.net/terra"
license=('GPL3')
depends=('python2-dbus' 'python2-gobject' 'vte3')
makedepends=('bzr' 'python2-distutils-extra')
provides=($_pkgname)
conflicts=($_pkgname)
source=($pkgname::bzr+https://code.launchpad.net/terra/trunk)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s" "$(bzr revno)"
}

package() {
  cd $pkgname
  python2 setup.py install --root="$pkgdir" --optimize=1
}

