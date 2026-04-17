# Maintainer: Cody Marsengill <cod.e.codes.dev@gmail.com>
pkgname=marchat-bin
pkgver=1.0.0
pkgrel=1
_pkgtag=v1.0.0
pkgdesc='Terminal chat with WebSockets (official release binaries)'
arch=('x86_64' 'aarch64')
url='https://github.com/Cod-e-Codes/marchat'
license=('MIT')
options=('!strip')
depends=('glibc')
source_x86_64=("marchat-${_pkgtag}-linux-amd64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-amd64.zip")
source_aarch64=("marchat-${_pkgtag}-linux-arm64.zip::https://github.com/Cod-e-Codes/marchat/releases/download/${_pkgtag}/marchat-${_pkgtag}-linux-arm64.zip")
sha256sums_x86_64=('bc5f1ef7fdfa50d04a9925ebab073ba2a0e1db2255f69c74f097c185f8252259')
sha256sums_aarch64=('496d2985df4f1144c34ffeb8002f679ea05f1c66fd27119966038a468eca016c')

package() {
  if [[ $CARCH == x86_64 ]]; then
    install -Dm755 "$srcdir/marchat-client-linux-amd64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-amd64" "$pkgdir/usr/bin/marchat-server"
  else
    install -Dm755 "$srcdir/marchat-client-linux-arm64" "$pkgdir/usr/bin/marchat-client"
    install -Dm755 "$srcdir/marchat-server-linux-arm64" "$pkgdir/usr/bin/marchat-server"
  fi
}
