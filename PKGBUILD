# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=2.9.5
pkgrel=1
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
options=(!emptydirs)
source=("https://pypi.io/packages/source/u/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('99892f33b5c6bf97053beac84c8a136747631828f030725e9a01147d48377337')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
