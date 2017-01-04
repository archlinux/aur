# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=hledger
pkgver=1.1
pkgrel=1
pkgdesc="Command-line and web-based accounting tool"
arch=('i686' 'x86_64')
depends=('gmp libffi ncurses zlib')
makedepends=('haskell-stack')
url="http://hledger.org"
license=('GPL3')
options=('strip')
source=("https://github.com/simonmichael/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('b47055fb218c7e8b254bc663c5a63398504d2dfa8daf80646b04983f4d488edb')
provides=('hledger' 'hledger-api' 'hledger-ui' 'hledger-web')
conflicts=('hledger' 'hledger-api' 'hledger-ui' 'hledger-web')

package() {
  cd $pkgname-$pkgname-$pkgver

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  stack --system-ghc --local-bin-path "$pkgdir/usr/bin" install
}
