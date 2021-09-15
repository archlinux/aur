# Maintainer: TargetGalaxy <maibannightly@gmail.com>
pkgname=lightpkg
pkgver=1.1
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
sha256sums=('58a7213a224e6f1da82d85988560e1ca55a156fe59e201694a1260929757a8d0')
build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
