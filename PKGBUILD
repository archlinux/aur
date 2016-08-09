# Maintainer: Kasei Wang <cnsdwpc at gmail.com>
_pkgname=kcptun
pkgname=$_pkgname-bin
pkgver=20160808
pkgrel=1
pkgdesc="an extremely simple & fast udp tunnel based on kcp protocol"
arch=("i686" "x86_64")
url="https://github.com/xtaci/kcptun"
license=("MIT")
depends=()
provides=()
replaces=()
conflicts=()

if [ "$CARCH" = "i686" ]; then
  _arch="386"
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="amd64"
fi
source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
sha256sums=('934f65ca29d53d6d78dca1817cc60f1a9e76a07b50e47f22f01fcc32ed065f82')

package() {
  cd "$srcdir/"
  install -Dm755 client_linux_$_arch "$pkgdir/usr/bin/kcptun_client"
  install -Dm755 server_linux_$_arch "$pkgdir/usr/bin/kcptun_server"
}
