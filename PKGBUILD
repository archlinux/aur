# Maintainer: ika4422 jaiden.lily.brooke@gmail.com
pkgname=rpnx
pkgver=1.0.0
pkgrel=1
pkgdesc="a simple reverse polish notation calculator written in C++"
arch=('x86_64')
url="https://git.softkittypa.ws/ika4422/rpnx"
license=('CNPLv8')
depends=('glibc' 'gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2e58fe6ee9a194924fdf0bb97a51c4514e33f822dfa9424659b8e785b4f1215c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
