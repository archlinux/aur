# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.3.1
pkgrel=1
pkgdesc="A music production session manager"
arch=(x86_64)
url="https://www.laborejo.org/agordejo/"
license=(GPL3)
groups=(pro-audio)
depends=(glibc hicolor-icon-theme new-session-manager python python-pyqt5
ttf-dejavu)
source=("https://laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('addb91c53acd7ff1a608d25d1ca6901e502ec384b38a474100dbf0f317ebefcfa83b33f99bfc6aa5053b575e5f592bbe6b9bbe9b4f06b6417261449ef653e2fc'
            'SKIP')
b2sums=('8ceda940dd33f390de9b0ece12a649c03cd433ea46aa634db8bbed0017022f6c54b06ac105a8ce1cc9e6a3c894cfa638544be848e4255886e2bfae7fe0d9ea24'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
