# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>
pkgname=onefetch
pkgver=1.5.1
pkgrel=1
pkgdesc="Displays info about software projects"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('3987f44adc08358ca1944c06bedddea93bf33094ef9e5e7e849a4d75d23ff2d9')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
