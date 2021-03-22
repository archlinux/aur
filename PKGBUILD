# Original Maintainer: Evan McCarthy <evan@mccarthy.mn>
# Maintainer: neko <hi@neko.vg>

pkgname=pounce
pkgver=2.3
pkgrel=1
pkgdesc='A a multi-client, TLS-only IRC bouncer using a multiple-consumer ring buffer and the IRCv3.2 server-time extension to communicate with clients.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('f9b78815ca4bc82ca3f840e67e736bf2')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
