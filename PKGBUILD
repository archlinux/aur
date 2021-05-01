# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: garion < garion @ mailoo.org >

pkgname=mkclean
pkgver=0.9.0
pkgrel=1
pkgdesc="Clean up and optimize MKV files"
arch=('x86_64')
url='http://www.matroska.org/downloads/mkclean.html'
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("http://sourceforge.net/projects/matroska/files/mkclean/mkclean-${pkgver}.tar.bz2")
sha256sums=('2f5cdcab0e09b65f9fef8949a55ef00ee3dd700e4b4050e245d442347d7cc3db')

prepare(){
  mkdir -p build
}

build(){
  cd build
  cmake "../mkclean-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package(){
  install -Dm755 build/mkclean/mkclean "${pkgdir}/usr/bin/mkclean"
  install -Dm644 "mkclean-${pkgver}/ReadMe.txt" "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
