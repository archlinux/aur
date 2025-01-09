# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=fetchfetch
pkgver=1.1.0
pkgrel=1
pkgdesc='Fetch info about your *fetch tools'
arch=('x86_64')
url="https://github.com/spenserblack/$pkgname"
license=('GPL-3.0-or-later')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ca2ea2bf3d463558828caa4e6c95ee7d5d9b18cccf1ad0390bbfca02b28c9a32')
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
