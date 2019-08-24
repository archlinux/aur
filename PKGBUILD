# Maintainer: KingofToasters <dev at sgregoratto dot me>
pkgname=onefetch
pkgver=1.5.5
pkgrel=1
pkgdesc="Displays info about software projects"
url="https://github.com/o2sh/onefetch"
license=('MIT')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('cargo')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('8627c81ec513bae8b61a678e96391bb5b024a0424b3384b398160748bd14028d')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
