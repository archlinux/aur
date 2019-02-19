# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=onefetch
pkgver=1.5.2
pkgrel=1
pkgdesc="Displays info about software projects"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('58cbdb113320a08fa4356a76ce1f376cd7fc412015abd0daf47415ea2db5bf65')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
