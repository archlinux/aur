# Original Maintainer: Evan McCarthy <evan@mccarthy.mn>
# Maintainer: neko <hi@neko.vg>

pkgname=pounce
pkgver=2.2
pkgrel=1
pkgdesc='A a multi-client, TLS-only IRC bouncer using a multiple-consumer ring buffer and the IRCv3.2 server-time extension to communicate with clients.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('16c5821533b3c512b4261bf23414e3e2')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
