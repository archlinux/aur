# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.1.1
pkgrel=2
pkgdesc="A music production session manager"
arch=('x86_64')
url="https://www.laborejo.org/agordejo/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'new-session-manager' 'python'
'python-pyqt5' 'ttf-dejavu')
makedepends=('nuitka')
# TODO: remove provides/conflicts/replaces 2021-01-31
provides=('argodejo')
conflicts=('argodejo')
replaces=('argodejo')
source=("https://laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('b65558011d4f3bcc9f4a159ffaea9fb5135c0fb402b3f80f582c28e095114e226f1a7e63863e5cb7bdd0d681814a86af98388b65ad34d80ae15df629aadb6eca'
            'SKIP')
b2sums=('63db36f67e24038ebbceac6ff36b71472845d65000be8ddd8bdab54e76402028ce88e2a21fbcf3cd64132e03ae1a568f7d2db54c2817bddf7a0115ee30cfaa57'
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
