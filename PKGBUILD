# Maintainer: TargetGalaxy <maibannightly@gmail.com>
pkgname=lightpkg
pkgver=1.0.1
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

sha256sums=('def5ab01829a6c2057cc76157d2c7d9d1a4a1ead761739d27849269d93201a94')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
