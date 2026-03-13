pkgname=cmdchamp
pkgver=1.0.7
pkgrel=1
pkgdesc='Pure bash CLI trainer — 30 levels from ls to privilege escalation'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash>=4.3')
optdepends=('bubblewrap: sandbox mode for real command execution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

check() {
  cd "$pkgname-$pkgver"
  ./cmdchamp test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
