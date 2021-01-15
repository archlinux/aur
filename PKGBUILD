# Maintainer: Maurizio D'Addona <mauritiusdadd@libero.it>

pkgname=freecad-fcgear-git
pkgver=r193.8b0d8e9
pkgrel=2
pkgdesc="Freecad workbench to generate various gears"
arch=('any')
url="https://freecadweb.org/wiki/Macro_FCGear"
license=('GPL2')
provides=('freecad-fcgear')
depends=('freecad>=0.15')
makedepends=('git' 'python2-setuptools')

source=("git+https://github.com/looooo/FCGear.git")
sha256sums=('SKIP')

pkgver() {
  cd "FCGear"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "FCGear"
  python2 setup.py build
}

package() {
  cd "FCGear"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

