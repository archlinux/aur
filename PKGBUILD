# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname=xmonad-log
pkgver=0.1.0
pkgrel=1
pkgdesc="DBus monitor for xmonad log events"
arch=('x86_64' 'i686')
url="https://github.com/xintron/xmonad-log"
license=('MIT')
makedepends=('go' 'dbus-go')
options=('!strip' '!emptydirs')
source=("https://github.com/xintron/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('b08ca8db87c0418819f6f0c546fe18da336adbc9d0b3e95205bb2690095d6dd4')

build() {
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
