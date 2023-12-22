# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

_pkgname=tiny
pkgname=$_pkgname-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='A terminal IRC client written in Rust'
arch=('x86_64')
license=('MIT')
provides=($_pkgname)
replaces=('tiny-irc-client-bin')
url="https://github.com/osa1/$_pkgname"
source=(
  "${url}/releases/download/v${pkgver}/tiny-ubuntu-20.04-libssl-dbus.tar.gz"
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('50270e04798809f883cc596161d4f93cefbf22a3a73481b58d4fd5701ff60a86'
            '4bd412760a35ff41220ab918702d003c710379537db9621477f63ee201a68440')

package() {
  install -Dm755 "$srcdir/tiny" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
