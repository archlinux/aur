# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=tiny
pkgname=$_pkgname-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='A terminal IRC client written in Rust'
arch=('x86_64')
license=('MIT')
provides=($_pkgname)
replaces=('tiny-irc-client-bin')
url="https://github.com/osa1/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/tiny-ubuntu-22.04-libssl-dbus.tar.gz"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('c9215f6f0ef28c6190041f8dbeb1026f5dd7e4cd90f273626ebcd78ab877ffe8'
            '95406a234fe4c7013edab622970e89a5b56d4441fb5c1ec871a992fc6ee8db7a')

package() {
  install -Dm755 "$srcdir/tiny" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
