# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=roguesynth-git
_gitname=rogue
pkgver=405.a7c6579
pkgrel=2
pkgdesc="Multimode softsynth with LV2 interface"
arch=(i686 x86_64)
url="https://github.com/timowest/rogue"
license=('GPL')
groups=('lv2-plugins')
depends=('lv2' 'lvtk' 'fftw' 'qt4')
makedepends=('python-rdflib')
source=('git://github.com/timowest/rogue.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make INSTALL_DIR="$pkgdir/usr/lib/lv2" install
}
