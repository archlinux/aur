# Author: metak <https://bbs.archlinux.org/viewtopic.php?id=225365>
# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>

pkgname=caja-deja-dup-bzr
pkgver=0.0.9.r25
pkgrel=2
pkgdesc="Caja File browser context menu items to backup or restore files/ folders via Deja Dup"
url="https://launchpad.net/deja-dup-caja"
arch=('any')
license=('GPL3')
groups=()
depends=('deja-dup' 'python-caja')
makedepends=('breezy' 'python-distutils-extra')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::bzr+lp:deja-dup-caja")
md5sums=('SKIP')
install=caja-deja-dup-bzr.install

pkgver() {
  cd ${pkgname%-*}
  version=$(grep -oP 'version      = "\K[^"]+' setup.py)
  printf "%s.r%s" "$version" "$(bzr revno)"
}

package() {    
  cd ${pkgname%-*}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
