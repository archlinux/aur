pkgname=arpackpp
pkgver=2.3.0
pkgrel=1
pkgdesc="Arpack++ with patches"
arch=('any')
url="http://reuter.mit.edu/software/arpackpatch/"
license=('BSD')
depends=('arpack')
optdepends=('superlu' 'umfpack')
source=("https://github.com/m-reuter/arpackpp/archive/${pkgver}.tar.gz")
md5sums=('1b09e35b6c44e118003922643b99978a')

package()
{
  cd ${srcdir}/arpackpp-${pkgver}

  # install headers
  install -d ${pkgdir}/usr/include/arpackpp
  install include/*.h ${pkgdir}/usr/include/arpackpp

  # install docs
  install -d ${pkgdir}/usr/share/doc/arpackpp
  install doc/* ${pkgdir}/usr/share/doc/arpackpp

  # install tutorials
  install -d ${pkgdir}/usr/share/arpackpp/examples
  cp -r examples/* ${pkgdir}/usr/share/arpackpp/examples
}
