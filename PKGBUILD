# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.0.0.1
pkgrel=1
pkgdesc="The Open Edition of the F# compiler, core library and tools"
arch=('any')
url="http://fsharp.org/"
license=('Apache')
depends=('mono')
source=($pkgname-$pkgver.tar.gz::https://github.com/fsharp/$pkgname/archive/$pkgver.tar.gz)
md5sums=('d0635967ee6fca8e1c3f593934bac6a0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
