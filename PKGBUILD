# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=arnie-git
pkgver=r6.aba5b75
pkgrel=2
pkgdesc="ZNC plugin to make bridged IRC channels appear more natural"
arch=('any')
url="https://github.com/LukeMoll/arnie"
license=('BSD')
depends=('znc' 'python')
makedepends=('git')
provides=('arnie')
replaces=('arnie')
source=("git+https://github.com/LukeMoll/arnie.git")

pkgver() {
  cd "${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname/-git/}"
  install -Dm644 arnie.py "$pkgdir/usr/lib/znc/arnie.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP')
