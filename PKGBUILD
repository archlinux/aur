# Maintainer: Cody Marsengill <cod.e.codes.dev@gmail.com>
pkgname=marchat-bin
pkgver=0.11.0.beta.5
pkgrel=1
_pkgtag=v0.11.0-beta.5
pkgdesc='Terminal chat with WebSockets (official release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cod-e-Codes/marchat'
license=('MIT')
options=('!strip')
depends=('glibc')
source_x86_64=("marchat-${_pkgtag}-linux-amd64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-amd64.zip")
source_aarch64=("marchat-${_pkgtag}-linux-arm64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-arm64.zip")
sha256sums_x86_64=('9d12a7d422723abf328c35428902507e1db79b1386c41213952c71a8d328a0ad')
sha256sums_aarch64=('bc7dc2048d488869d1a56af2f2b2c94c68043f2d3a0d4ba08b66893e46e1252d')

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/marchat-client-linux-amd64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-amd64" "$pkgdir/usr/bin/marchat-server"
  else
    install -Dm755 "$srcdir/marchat-client-linux-arm64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-arm64" "$pkgdir/usr/bin/marchat-server"
  fi
}
