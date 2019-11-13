# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=onefetch
pkgver=2.1.0
pkgrel=1
pkgdesc="Git repository summary on your terminal"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('54c7b543b39cf22bac2505c792d7fbba75bfdbe1a19900879b439dc65c75c414')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
