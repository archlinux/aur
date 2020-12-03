# Original Maintainer: Evan McCarthy <evan@mccarthy.mn>
# Maintainer: lillian rose winter <hi@neko.vg>

pkgname=catgirl
pkgver=1.3
pkgrel=1
pkgdesc='catgirl is a TLS-only terminal IRC client.'
arch=('x86_64')
url="https://git.causal.agency/${pkgname}/"
license=('GPL3')
depends=('libretls' 'ncurses')
source=("https://git.causal.agency/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
md5sums=('778550440a5e01e8b14bc1411b3424bd')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
