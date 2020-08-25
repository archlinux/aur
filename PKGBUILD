# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=pounce
pkgver=1.4p1
pkgrel=1
pkgdesc='A a multi-client, TLS-only IRC bouncer using a multiple-consumer ring buffer and the IRCv3.2 server-time extension to communicate with clients.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5de0c07fad5fa778f88f3c487531dab7480f6d89d912fda3ceb16de2a7a5b33501986a54d0ee643880cc609b7e6a4274c9e568617e788af50993bd77b9a532f4')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
