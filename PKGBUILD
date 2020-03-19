# Author: metak <https://bbs.archlinux.org/viewtopic.php?id=225365>
# Contributor: Edmund Lodewijks <e.lodewijks@gmail.com>

pkgname=caja-deja-dup-bzr
pkgver=0.0.8
pkgrel=1
pkgdesc="Deja Dup extension for Caja File Browser"
url="https://launchpad.net/deja-dup-caja"
arch=('any')
license=('GPL3')
groups=()
depends=('deja-dup' 'python2-caja')
makedepends=('bzr' 'python2-distutils-extra')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::bzr+lp:deja-dup-caja")
md5sums=('6db533bbe1f101bf2fe3c05deca0d2e6')

pkgver() {
  cd ${pkgname%-*}
  version=$(grep -oP 'version      = "\K[^"]+' setup.py)
  printf "%s.r%s" "$version" "$(bzr revno)"
}

package() {    
  cd ${pkgname%-*}
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
