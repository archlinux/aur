# Maintainer: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

pkgname=fetchfetch
pkgver=2.0.0
pkgrel=1
pkgdesc='Fetch info about your *fetch tools'
arch=('x86_64')
url="https://github.com/spenserblack/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e67be2f63497b6f75017873e06935218a407e46023fe10f422fb259e92a7d7ae')
makedepends=('make' 'gcc')
depends=('glibc')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}