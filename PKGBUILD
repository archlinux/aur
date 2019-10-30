pkgname=mingw-w64-spectra
pkgver=0.8.1
pkgrel=1
pkgdesc="A header-only C++ library for large scale eigenvalue problems (mingw-w64)"
license=('MPL2')
arch=('any')
url="https://spectralib.org/"
depends=('mingw-w64-eigen')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/yixuan/spectra/archive/v${pkgver}.tar.gz")
sha256sums=('339ae9221309a128b8d937ca59b77d9b30aeceacb4ef2d2df13f6f7cde7fa3f3')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/spectra-$pkgver
    install -d "$pkgdir"/usr/${_arch}
    cp -r include "$pkgdir"/usr/${_arch}
  done
}

