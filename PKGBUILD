# Maintainer: Cédric Connes <cedric.connes@gmail.com>

pkgname=megaproxy
pkgver=0.1.0
pkgrel=1
pkgdesc="HTTP proxy for mega.nz"
arch=('i686' 'x86_64')
url="https://github.com/connesc/megaproxy"
license=('ISC')
depends=('mega-sdk'
         'boost-libs')
makedepends=('boost')
source=("https://github.com/connesc/megaproxy/archive/v$pkgver.tar.gz")
md5sums=('73dbbd52695cf73107196fd7eba8e9aa')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 megaproxy "$pkgdir/usr/bin/megaproxy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
