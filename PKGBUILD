pkgname=chromono
pkgver=1.1.0
pkgrel=1
pkgdesc="A very circular color puzzle game"
arch=('x86_64')
url=https://thp.io/2013/chromono/
license=('GPL')
depends=('sdl2' 'zlib' 'libvorbis' 'libglvnd')
makedepends=('cmake' 'python3')
source=("https://thp.io/2013/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9a15fa795e4f14ef8683c5ddaf1b6c115fda306957c97604fc4f117599c9f2ae')

build() {
  cd ${pkgname}-${pkgver}
  cmake -B build -DCMAKE_INSTALL_PREFIX=/usr .
  make -C build
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build install DESTDIR="${pkgdir}/"
}

# vim:set ts=2 sw=2 et:
