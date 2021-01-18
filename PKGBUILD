# Original Maintainer: Evan McCarthy <evan@mccarthy.mn>
# Maintainer: lillian rose winter <hi@neko.vg>

pkgname=catgirl
pkgver=1.5
pkgrel=1
pkgdesc='catgirl is a TLS-only terminal IRC client.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('dc847faf982c55780ca6c1f1f1be2b57')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
