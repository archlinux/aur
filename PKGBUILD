# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.4.1
pkgrel=1
pkgdesc="A music production session manager"
arch=(any)
url="https://www.laborejo.org/agordejo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme new-session-manager python python-pyqt5
python-pyxdg ttf-dejavu)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('01fb3d1329f1bcc95e0f17d80ab65a2d99cb94e3864ded3818f83ccc6e4685966be545f073ad82c8bc76a120bcf5348a62511d52a28775cc563b6dc8a19f39ab'
            'SKIP')
b2sums=('7261b55cc764ca432bbdf13fb54ab4b8b7049be249410f553aff9d937f0a816c76dae7e534aa4dd9d4a26ce983e219db4e25f89c1619721e0e4e8f70bf8cbdb4'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  make DESTDIR="$pkgdir" install -C $pkgname-$pkgver
}
