# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
pkgname=litecoin-daemon
pkgver=0.17.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
license=('MIT')
pkgdesc="Peer-to-peer digital currency, official binary release for servers (includes litecoind and litecoin-cli)"
options=('!strip')
depends=('openssl')
source_x86_64=("https://download.litecoin.org/litecoin-$pkgver/linux/litecoin-$pkgver-x86_64-linux-gnu.tar.gz")
source_i686=("https://download.litecoin.org/litecoin-$pkgver/linux/litecoin-$pkgver-i686-pc-linux-gnu.tar.gz")
md5sums_i686=('9e28e4d172821d485423acbd05655b57')
md5sums_x86_64=('a152828cd984c4dda16719aa406609ff')


package() {
  cd "$srcdir/litecoin-$pkgver/bin"

  destdir="$pkgdir/opt/$pkgname"

  mkdir -p "$destdir"
  cp * "$destdir"

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoin-cli" "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/litecoind" "$pkgdir/usr/bin"
}
