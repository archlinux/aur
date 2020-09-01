# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=msgpack-erlang
pkgver=0.7.0
pkgrel=1
pkgdesc="MessagePack (de)serializer implementation for Erlang"
arch=('any')
url="https://github.com/msgpack/msgpack-erlang/"
source=("https://github.com/msgpack/$pkgname/archive/$pkgver.tar.gz")
license=('Apache')
makedepends=('rebar3' 'git' 'erlang-nox')
md5sums=('94f1ab3b0a3daf442817de6fdf730102')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package(){
  _destdir="$pkgdir"/usr/lib/erlang/lib/riakc
  mkdir -p "$_destdir"
  cd "$srcdir/$pkgname-$pkgver"
  cp -R src test "$_destdir"
}
