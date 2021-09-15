# Maintainer: TargetGalaxy <maibannightly@gmail.com>
pkgname=lightpkg
pkgver=1.1.1.1
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
sha256sums=('7effeabef8b7fcdbdd98a17c4cafe3285beaf9a839803d21af44c9dca3c3158e')
build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
