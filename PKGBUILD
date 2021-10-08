# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=megaproxy
pkgver=0.2.3
pkgrel=1
pkgdesc="HTTP proxy for mega.nz"
arch=('i686' 'x86_64')
url="https://github.com/connesc/megaproxy"
license=('ISC')
depends=('mega-sdk'
         'boost-libs')
makedepends=('boost')
source=("https://github.com/connesc/megaproxy/archive/v$pkgver.tar.gz")
b2sums=('af028dcbe215667403ceffbf4331de44e03f5bac080cccc9298f1efdd4ff25c8d4d1624bad58ef056465e631328dcb235190f0741c095ba06adf462ff56237c5')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 megaproxy "$pkgdir/usr/bin/megaproxy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
