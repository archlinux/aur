# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=fetchfetch
pkgver=1.0.1
pkgrel=1
pkgdesc='Fetch info about your *fetch tools'
arch=('x86_64')
url="https://github.com/spenserblack/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5f0ba0ebd68d2c6e83bb33086b96d5e02900876f17caaf21c3b6aa20cf22dc63')
makedepends=('make' 'gcc')
depends=('glibc')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
