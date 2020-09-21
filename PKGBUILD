# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=pounce
pkgver=2.0
pkgrel=1
pkgdesc='A a multi-client, TLS-only IRC bouncer using a multiple-consumer ring buffer and the IRCv3.2 server-time extension to communicate with clients.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
b2sums=('454e94834547f8018986c3c380ea92daf0c6af9be1df716ba63098ea7471f92fbdee6d746f9cb21af631f592717ce592a9e6226041e836680a31909a065c93a6')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
