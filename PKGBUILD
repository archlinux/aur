# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=hledger
pkgver=1.2
pkgrel=1
pkgdesc="Command-line and web-based accounting tool"
arch=('i686' 'x86_64')
depends=('gmp' 'libffi' 'ncurses' 'zlib')
makedepends=('haskell-stack')
url="http://hledger.org"
license=('GPL3')
options=('strip')
source=("https://github.com/simonmichael/$pkgname/archive/$pkgname-$pkgver.tar.gz")
sha512sums=('2e30d03057bc440121d7f0340434639fef90fa1f19a75e80cde52920a2ec051cbe1b84dcdff2da2ff5e3b6685ed39c37eaa0b2b72bacc64c78c4dfa709a73d41')
provides=('hledger' 'hledger-api' 'hledger-ui' 'hledger-web')
conflicts=('hledger' 'hledger-api' 'hledger-ui' 'hledger-web')

package() {
  cd $pkgname-$pkgname-$pkgver

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  stack --system-ghc --local-bin-path "$pkgdir/usr/bin" install
}
