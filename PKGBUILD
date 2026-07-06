# Maintainer: Cody Marsengill <cod.e.codes.dev@gmail.com>
pkgname=marchat-bin
pkgver=1.3.0
pkgrel=1
_pkgtag=v1.3.0
pkgdesc='Terminal chat with WebSockets (official release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cod-e-Codes/marchat'
license=('MIT')
options=('!strip')
depends=('glibc')
source_x86_64=("marchat-${_pkgtag}-linux-amd64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-amd64.zip")
source_aarch64=("marchat-${_pkgtag}-linux-arm64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-arm64.zip")
sha256sums_x86_64=('6375cfa4045d0f70ea1a2d59545cbb4c7b17fd1836d0ae7cf5411ac5243afe61')
sha256sums_aarch64=('dbe80c2a6a54aef7732274d4af39ebb6740402aef6b797a7e19ad8ffd14b33c4')

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/marchat-client-linux-amd64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-amd64" "$pkgdir/usr/bin/marchat-server"
  else
    install -Dm755 "$srcdir/marchat-client-linux-arm64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-arm64" "$pkgdir/usr/bin/marchat-server"
  fi
}
