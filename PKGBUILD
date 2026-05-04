pkgname=cmdchamp
pkgver=1.1.5
pkgrel=1
pkgdesc='CLI trainer — 30 levels from ls to privilege escalation'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash>=4.3')
optdepends=('bubblewrap: sandbox mode for real command execution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c47943031ef01c0685f537b682f8dcb163a7b9082a8a1c5d1aa5c605c29cb266')

check() {
  cd "$pkgname-$pkgver"
  ./cmdchamp test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
