# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.4.2
pkgrel=1
pkgdesc="A music production session manager"
arch=(any)
url="https://www.laborejo.org/agordejo/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme new-session-manager python python-pyqt5
python-pyxdg ttf-dejavu)
options=(debug)
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('22ac8c6ac8c0ee4b021f2470bac8ba0fbe15f2e49a1fa70abb68bee838c3d4799d613cc2f29e8a391b8a173c5cb983180889763796e05c3415ed8c20c2b96728'
            'SKIP')
b2sums=('2d31c7144b9d14af184e3f4730a35a66de2983114670d3717bd63ddab9f272567046779cb2f4f344b5a8b22b64f6c6f4271edbd5955c81ef2004d0d5d3ca5db1'
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
