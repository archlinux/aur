pkgname=chromono
pkgver=1.1.1
pkgrel=1
pkgdesc="A very circular color puzzle game"
arch=('x86_64')
url=https://thp.io/2013/chromono/
license=('GPL')
depends=('sdl2' 'zlib' 'libvorbis' 'libglvnd')
makedepends=('cmake' 'python3')
source=("https://thp.io/2013/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('3ed741e4bdc8ae7fa0019bd9643241856e5b49f6364048c6b3913f5948693afc')

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
