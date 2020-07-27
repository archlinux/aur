# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=loloswitcher
pkgver=0.30
pkgrel=1
pkgdesc='The low level keyboard language switcher for X11'
arch=('i686' 'x86_64')
url='https://github.com/xintrea/LoLoSwitcher'
license=('GPL3' 'BSD')
depends=('libx11' 'pcre')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/xintrea/LoLoSwitcher/archive/v.${pkgver}.tar.gz")
sha256sums=('068bc0efd3d39d38f5d4abb2a4858fa132f14482f81b8e940ae6781285dd1d76')

build() {
  cd "LoLoSwitcher-v.${pkgver}"
  rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "LoLoSwitcher-v.${pkgver}/build"
  install -Dm755 loloswitcher -t "${pkgdir}/usr/bin"
  install -Dm644 ../license_bsd.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: