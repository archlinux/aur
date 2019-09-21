# Maintainer: Andrea 'alephZer0' Gómez <crypto.andrea at protonmail dot ch> -> https://github.com/da-edra

pkgname=arpfox
pkgver=0.9.9
pkgrel=1
pkgdesc="An arpspoof alternative written in Go that injects specially crafted ARP packets into a LAN."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/malfunkt/arpfox"
license=('MIT')
depends=('libpcap')
makedepends=('go')
provides=("arpfox")
conflicts=("arpfox")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/malfunkt/arpfox/archive/v${pkgver}.tar.gz")
sha256sums=('50f151a0b8bcd309e77e7d9f83b1badaf14ba085f8fc85d5e23c0d1923c2550e')

build() {
  go get github.com/malfunkt/arpfox
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX=/usr install
}
