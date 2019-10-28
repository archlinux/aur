# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
pkgname=onefetch
pkgver=1.6.5
pkgrel=1
pkgdesc="Display info about software projects"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('50f069db2fa713024a19bf708add7812f3420b0c107eb68cd9907d76e375a06d')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
