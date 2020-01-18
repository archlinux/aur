# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgname=python-datashape
pkgver=0.5.4
pkgrel=1
pkgdesc='Data description protocol for dynd similar to Numpy DTypes.'
arch=('any')
url='https://github.com/blaze/datashape'
license=('BSD')
groups=('blaze-ecosystem')
makedepends=('python-setuptools')
depends=('python-numpy>=1.7'
         'python-multipledispatch>=0.4.7'
         'python-dateutil')
source=("https://github.com/blaze/datashape/archive/${pkgver}.tar.gz")
sha256sums=('c266c5803dde48b9fa8d8ee51b5b5979ef77443060e32db2d225b72648c638a5')

build() {
  cd "${srcdir}"/datashape-$pkgver
  python setup.py build
}

package_python-datashape() {
  cd "${srcdir}"/datashape-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README* "${pkgdir}/usr/share/doc/${pkgname}/README"
}
