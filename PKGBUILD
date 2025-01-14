# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

pkgname=psh
pkgver=1.0
pkgrel=1
pkgdesc='A small minimalistic shell'
arch=('x86_64')
url="https://github.com/proh14/$pkgname"
license=('Unlicense')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a3bb226c59292a257b86b68f248b2182a99732763dff7760f0c2d8998f7a5cb6')
makedepends=('make' 'clang')
depends=('glibc' 'readline')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "build/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:
