# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=apindex
pkgver=2.2
pkgrel=1
pkgdesc='Static HTML file index generator for Github Pages'
url='https://github.com/libthinkpad/apindex'
license=(BSD)
arch=(any)
depends=(python)
makedepends=(cmake make)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=('50faf021047275df72569a8e7236456c8149da883fa6d8777cc77037de644f77')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make install DESTDIR="${pkgdir}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
