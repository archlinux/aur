pkgname=mingw-w64-arpackpp
pkgver=2.3.0
pkgrel=1
pkgdesc="Arpack++ with patches (mingw-w64)"
arch=('any')
url="http://reuter.mit.edu/software/arpackpatch/"
license=('BSD')
depends=('mingw-w64-arpack')
source=("https://github.com/m-reuter/arpackpp/archive/${pkgver}.tar.gz")
md5sums=('1b09e35b6c44e118003922643b99978a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package()
{
  cd ${srcdir}/arpackpp-${pkgver}

  # install headers
  for _arch in ${_architectures}; do
    install -d ${pkgdir}/usr/${_arch}/include/arpackpp
    install include/*.h ${pkgdir}/usr/${_arch}/include/arpackpp
  done
}


