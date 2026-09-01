# Maintainer: Cody Marsengill <cod.e.codes.dev@gmail.com>
pkgname=marchat-bin
pkgver=1.3.6
pkgrel=1
_pkgtag=v1.3.6
pkgdesc='Terminal chat with WebSockets (official release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cod-e-Codes/marchat'
license=('MIT')
options=('!strip')
depends=('glibc')
source_x86_64=("marchat-${_pkgtag}-linux-amd64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-amd64.zip")
source_aarch64=("marchat-${_pkgtag}-linux-arm64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-arm64.zip")
sha256sums_x86_64=('a7e014e8ef161cea306c2cd2b08ab1a0265c852d10db0f1753f33963dde18ddf')
sha256sums_aarch64=('5b8a2ab693ade484704ddf8c45d47272928a4a551b341d122d71dbf7a2a5d7f3')

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/marchat-client-linux-amd64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-amd64" "$pkgdir/usr/bin/marchat-server"
  else
    install -Dm755 "$srcdir/marchat-client-linux-arm64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-arm64" "$pkgdir/usr/bin/marchat-server"
  fi
}
