# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=tembro
pkgver=0.5.0
pkgrel=1
pkgdesc="Virtual software instrument based on samples"
arch=(any)
url="https://laborejo.org/tembro/"
license=(GPL3)
groups=(pro-audio)
depends=(hicolor-icon-theme libcalfbox-lss python python-pyqt5 ttf-dejavu)
optdepends=('new-session-manager: for session management')
source=(https://laborejo.org/downloads/$pkgname-$pkgver.tar.gz{,.sig})
sha512sums=('b1fec8a7e662a1d470cc0b8ba7f0428fd2ca493f44a29a4414ee401b68d201d86425e4c83998c05969bad0eb928c6865572e6c001b2512b15f6688538ec301af'
            'SKIP')
b2sums=('03a0f1d13ba52762f959b2c7a94d93d4fa651193be6b323a42ad58f24c6a6592546ef6cb451c7917c8b9eeb8c374169cb4e30369b8d01c7893818198bea41f96'
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
