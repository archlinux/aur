pkgname=cmdchamp
pkgver=1.13.6
pkgrel=1
pkgdesc='CLI trainer — 30 levels from ls to privilege escalation'
arch=('any')
url='https://github.com/mellen9999/cmdchamp'
license=('MIT')
depends=('bash>=4.4')
optdepends=('bubblewrap: sandbox mode for real command execution')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('526e4653e0015caf97c8acbfaccf16af1f1608a8c1b65ae375a0c4f40d0e4b09')

check() {
  cd "$pkgname-$pkgver"
  ./cmdchamp test
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
