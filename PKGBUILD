# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=2.8.0
pkgrel=1
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/yt-project/${_module_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4fc95704cba4527604f21724d0d9845aea07831a6a2a3d1be9b9d18395e0c345')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
