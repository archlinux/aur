# Maintainer: Franz Miltz <franz@miltz.me>

pkgname=csv-split
pkgver=0.0.2
pkgrel=1
pkgdesc="A command line tool for splitting CSV files"
arch=('x86_64')
url="https://github.com/miltfra/csv-files"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/miltfra/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('266c98288f348ada648bc3a834e45996')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/LICENSE"
  install -Dm755 "bin/csv-split" "$pkgdir/usr/bin/csv-split"
}