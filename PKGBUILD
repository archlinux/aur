# Maintainer: TargetGalaxy <maibannightly@gmail.com>
pkgname=lightpkg
pkgver=1.1.1
pkgrel=1
pkgdesc="Yet another pacman/AUR helper."
arch=('i686' 'x86_64')
url="https://github.com/TargetGalaxy/lightpkg/"
license=('MIT')
groups=()
depends=(
  'pacman>5'
  'git'
  'sudo'
  'lua'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/TargetGalaxy/lightpkg/archive/v${pkgver}.tar.gz")
sha256sums=('a0935ce585ece00dbbc93af74e7f5eaa14f3b974c7075d13a0b4c1cdf01e50f1')
build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
