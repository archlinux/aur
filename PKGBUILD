#Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=erlang-jsx
_pkgname=${pkgname/erlang-//}
pkgver=2.5.2
pkgrel=1
pkgdesc="An erlang application for consuming, producing and manipulating json."
arch=('i686' 'x86_64')
url=https://github.com/talentdeficit/jsx/
license=('MIT')
depends=('erlang-nox')
makedepends=('rebar')
source=("https://github.com/talentdeficit/jsx/archive/v2.5.2.tar.gz")
md5sums=('2f9d7212772b843269ec5621387f98dd')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  make tests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  mkdir -p "$pkgdir"/usr/lib/erlang/lib/$pkgname
  for i in ebin src; do
    cp -R $i "$pkgdir"/usr/lib/erlang/lib/$pkgname
  done
  install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
