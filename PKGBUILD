# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=msgpack-erlang
pkgver=0.3.2
pkgrel=1
pkgdesc="MessagePack (de)serializer implementation for Erlang"
arch=('any')
url="https://github.com/msgpack/msgpack-erlang/"
source=("https://github.com/msgpack/$pkgname/archive/$pkgver.tar.gz")
license=('Apache')
makedepends=('rebar' 'git' 'erlang-nox')
md5sums=('01a1518095861b132d63878bea7a4ca8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package(){
  _destdir="$pkgdir"/usr/lib/erlang/lib/riakc
  mkdir -p "$_destdir"
  cd "$srcdir/$pkgname-$pkgver"
  cp -R ebin src test include "$_destdir"
}
