# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python-yt
_module_name=yt
pkgver=3.5.0
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python-numpy' 'python-matplotlib' 'cython' 'python-nose' 'python-sympy' 'python-h5py')
makedepends=('cython')
optdepends=('jupyter')
options=(!emptydirs)
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('ee4bf8349f02ce21f571654c26d85c1f69d9678fc8f5c7cfe5d1686c7ed2e3ca')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
