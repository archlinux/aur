# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=fsharp
pkgver=4.0.0.3
pkgrel=2
pkgdesc="The Open Edition of the F# compiler, core library and tools"
arch=('any')
url="http://fsharp.org/"
license=('Apache')
depends=('mono>=4.0.3.20')
source=($pkgname-$pkgver.tar.gz::https://github.com/fsharp/$pkgname/archive/$pkgver.tar.gz)
md5sums=('84b55c971d275e2e8a456b5135fb8e19')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
