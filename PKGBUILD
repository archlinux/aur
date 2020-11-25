# Maintainer: Jove Yu <yushijun110 at 126 dot com>

pkgname=hev-dns-forwarder
pkgver=0.0.1
pkgrel=1
pkgdesc="Forwarding DNS queries on TCP transport"
url="https://github.com/aa65535/hev-dns-forwarder"
arch=("i686" "x86_64")
license=("GPL3")
provides=()
conflicts=()
depends=("glibc")
source=("git+https://github.com/aa65535/hev-dns-forwarder.git"
    "hev-dns-forwarder.service")
sha256sums=('SKIP'
         '649f7fecdf4be14197546f382e6ab78accd762f10869562a5748f48cd528e13d')

build() {
  cd "$srcdir/hev-dns-forwarder"
  make
}

package() {
  install -Dm755 "$srcdir/hev-dns-forwarder/src/hev-dns-forwarder" "$pkgdir/usr/bin/hev-dns-forwarder"
  install -Dm644 "$srcdir/hev-dns-forwarder.service" "$pkgdir/usr/lib/systemd/system/hev-dns-forwarder.service"
}

