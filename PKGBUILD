# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.4.0
pkgrel=1
pkgdesc="A music production session manager"
arch=(any)
url="https://www.laborejo.org/agordejo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme new-session-manager python python-pyqt5
python-pyxdg ttf-dejavu)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('9b4b2a9e8b80b25014ddf5882b6ea3864e925525f30a5e5253dcb410e3d7641729f1f6ce338e2a7f27294d97ed5776d5cbde1a67ab4dd60e3d59a0c78b71259d'
            'SKIP')
b2sums=('28a9c8e9959ce4358ea5a7512dfe25f6b6f3be028a1321116eafb244880828dc1aa5b57c1e42b1571f184bee1764c919323da50b41506ad735083800c73ccbd5'
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
