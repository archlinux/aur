# Maintainer: Clément Hamada <clementhamada@protonmail.com>
pkgname=swaylock-blur-fast-git
pkgver=r1.2aca716
pkgrel=1
pkgdesc="Fast and configurable script to run swaylock with blurred screenshots."
arch=('any')
url="https://github.com/ClemaX/swaylock-blur-fast"
license=('MIT')
depends=('sway' 'swaylock' 'grim' 'jq')
makedepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/ClemaX/swaylock-blur-fast.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install swaylock-blur -Dt "$pkgdir/usr/bin"
}

