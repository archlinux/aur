# Maintainer: TargetGalaxy <maibannightly@gmail.com>
pkgname=lightpkg
pkgver=1.0.1.2
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

sha256sums=('811e2cafccc4b84313f829f4f95ed78098a5ee2fecae2b8484276ef19c56208b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
