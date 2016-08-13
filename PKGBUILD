# Maintainer: Kasei Wang <cnsdwpc at gmail.com>
_pkgname=kcptun
pkgname=$_pkgname-bin
pkgver=20160811
pkgrel=1
pkgdesc="An extremely simple udp tunnel based on KCP"
arch=("i686" "x86_64")
url="https://github.com/xtaci/kcptun"
license=("MIT")
depends=()
provides=()
replaces=()
conflicts=()

if [ "$CARCH" = "i686" ]; then
  _arch="386"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  md5sums=('623c9d5ed4ace14dba17401e51bd3c79')
fi
if [ "$CARCH" = "x86_64" ]; then
  _arch="amd64"
  source=("https://github.com/xtaci/kcptun/releases/download/v$pkgver/kcptun-linux-$_arch-$pkgver.tar.gz")
  md5sums=('976250b8e44c696bd5c0a66a9c274067')
fi

package() {
  cd "$srcdir/"
  install -Dm755 client_linux_$_arch "$pkgdir/usr/bin/kcptun_client"
  install -Dm755 server_linux_$_arch "$pkgdir/usr/bin/kcptun_server"
}
