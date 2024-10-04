# Maintainer: Mitesh Soni <smiteshhc@gmail.com>
pkgname=timez
pkgver=1.3.0
pkgrel=1
pkgdesc="A simple utility to measure execution time and resource usage of commands"
arch=('x86_64')
url="https://github.com/miteshhc/timez"
license=('MIT')
depends=()
makedepends=('make')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('58ec7275adfd882f794ae55ec3184f4798f1356b0eae24daff5e13dfc49be642')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  # Install the binary to /usr/bin/
  install -Dm755 timez "$pkgdir/usr/bin/timez"

  # Install the license to /usr/share/licenses/timez/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
