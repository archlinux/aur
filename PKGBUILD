# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=cppinclude
pkgver=0.5.0
pkgrel=2
pkgdesc='Tool for analyzing includes in C++'
url='https://github.com/cppinclude/cppinclude'
license=('MIT')
arch=('x86_64')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31c36a347b43ee667c6f17121c2d0fb7cf4d2672130f25273a48835b21f6ae40')

build() {
  cmake "$pkgname-$pkgver"
  make
}

package() {
  install -Dm755 -t "$pkgdir/usr/bin" cppinclude
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgname-$pkgver/LICENSE"
}
