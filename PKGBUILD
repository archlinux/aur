# Maintainer: Cody Marsengill <cod.e.codes.dev@gmail.com>
pkgname=marchat-bin
pkgver=1.3.5
pkgrel=1
_pkgtag=v1.3.5
pkgdesc='Terminal chat with WebSockets (official release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cod-e-Codes/marchat'
license=('MIT')
options=('!strip')
depends=('glibc')
source_x86_64=("marchat-${_pkgtag}-linux-amd64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-amd64.zip")
source_aarch64=("marchat-${_pkgtag}-linux-arm64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-arm64.zip")
sha256sums_x86_64=('7d699faea2b50e0a009aadef6f4816a9a17b98a5f202667a45efccfeb3be5c5d')
sha256sums_aarch64=('2664c9f1af04bd651b5e6fa48df99b1793cd91190aa1f0b985a5ae4577cc0ac5')

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/marchat-client-linux-amd64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-amd64" "$pkgdir/usr/bin/marchat-server"
  else
    install -Dm755 "$srcdir/marchat-client-linux-arm64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-arm64" "$pkgdir/usr/bin/marchat-server"
  fi
}
