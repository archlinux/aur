# Maintainer: Dvd-Znf <email@dvdznf.xyz>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

pkgname=fetchfetch
pkgver=1.1.1
pkgrel=2
pkgdesc='Fetch info about your *fetch tools'
arch=('x86_64')
url="https://github.com/spenserblack/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2619725b139290a0842dedf53164fbf372468875aab8629d72ea88d1b7be60dd')
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