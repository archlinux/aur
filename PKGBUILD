pkgname=cmdchamp
pkgver=1.13.4
pkgrel=1
pkgdesc='CLI trainer — 30 levels from ls to privilege escalation'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash>=4.4')
optdepends=('bubblewrap: sandbox mode for real command execution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b760df7fca04ba1415ca7b02f13e76b6eb725b4c418bb4ccd63bc508fcfebbfd')

check() {
  cd "$pkgname-$pkgver"
  ./cmdchamp test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
