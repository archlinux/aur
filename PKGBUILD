# Maintainer: Denbeigh Stevens <denbeigh at denbeighstevens dot com>
# Contributor: Denbeigh Stevens

pkgname='goi3bar-git'
pkgrel=1
pkgver=87ac1f
pkgdesc='A configurable, extensivle replacement for i3status written in Go'
url='https://github.com/denbeigh2000/goi3bar'
arch=('x86_64' 'i686')
license=('GPL2')
conflicts=('goi3bar')
provides=('goi3bar')
depends=()
makedepends=('git' 'go>=1.5.0')
optdepends=('wireless_tools: WLAN plugin support')
_gourl=github.com/denbeigh2000/goi3bar

build() {
  GOPATH="$srcdir" go get -u -v ${_gourl}/...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/goi3bar" "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
