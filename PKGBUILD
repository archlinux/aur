# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=2.8.0
pkgrel=2
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
options=(!emptydirs)
source=("https://pypi.io/packages/source/u/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('6a17f849af0ec376fccb111c26b767022189d157d416f0fe5078f31b6b01a22e')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
