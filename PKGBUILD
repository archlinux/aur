pkgname=cmdchamp
pkgver=1.4.1
pkgrel=1
pkgdesc='CLI trainer — 30 levels from ls to privilege escalation'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash>=4.4')
optdepends=('bubblewrap: sandbox mode for real command execution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('820bce1470827908adbd12d57f5cb7e17affd3bab9a0dc05e2a71ccb227ad841')

check() {
  cd "$pkgname-$pkgver"
  ./cmdchamp test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
