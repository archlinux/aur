# Maintainer: Álvaro Jesús Baena Rosino <alvarojsino8 at gmail dot com>
pkgname='mecano'
pkgver='0.1.0'
pkgrel='1'
epoch='2'
pkgdesc='Minimalistic typing train'
arch=('x86_64')
depends=('glibc')
makedepends=('cargo')
source=(
   'https://github.com/alvarojsino813/mecano/archive/refs/tags/0.1.0.tar.gz'
   )
license=('apache')

build() {
   cd "$srcdir/$pkgname-$pkgver"
   cargo build --release --target-dir=target
   cd ../..
}

package() { 
   install -d "$pkgdir/usr/share/$pkgname/dictionaries"
   install -Dm755 "$srcdir/$pkgname-$pkgver/mecano.toml" "$pkgdir/usr/share/$pkgname"
   cp -r "$srcdir/$pkgname-$pkgver/dictionaries/" "$pkgdir/usr/share/$pkgname/"
   install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/mecano" "$pkgdir/usr/bin/$pkgname"
}

sha256sums=('d67278e5a83f9f087f26f4bc1657833e902b48f948ce61e48abf9fdcad025b75')
