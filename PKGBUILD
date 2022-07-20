# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tembro
pkgver=0.5.1
pkgrel=1
pkgdesc="Virtual software instrument based on samples"
arch=(any)
url="https://laborejo.org/tembro/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('9adc9137e90384c2c234f5079e4379c98dfcd90582f2db7e23e47cb67d28450cd906155e4f65fd35ecfe346e832e11b7ae2e8eb1166d5e38d9425e7a221414f4'
            'SKIP')
b2sums=('cc23d6662ad3fd57b9412171b5b36456312dfcfe6abfd12b5d9cd458575509010bae457cb965db3d811853a01fc00e8081a62162c79e696694b422083f034899'
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
