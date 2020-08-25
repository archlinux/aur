# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=catgirl
pkgver=1.1p1
pkgrel=1
pkgdesc='catgirl is a TLS-only terminal IRC client.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e361fda334e40f9cc667fa910aeb881990eccf70a023c5a0076509726a14c23ba18ecce60f6131e9d3711fa1173b2975f288f977f6884a5700b89dae28cc71b6')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
