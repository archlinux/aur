# Maintainer: Stuart Mumford <stuart@cadair.com>
pkgname=python-yt
_module_name=yt
pkgver=3.3.2
pkgrel=1
pkgdesc="A community-developed analysis and visualization toolkit for volumetric data."
arch=(any)
url="http://yt-project.org"
license=('BSD')
depends=('python-numpy' 'python-matplotlib' 'cython' 'python-nose' 'python-sympy' 'python-h5py')
optdepends=('jupyter')
options=(!emptydirs)
source=("https://pypi.io/packages/source/y/${_module_name}/${_module_name}-${pkgver}.tar.gz")
md5sums=('405211ea89a0d40eb289363055a54291')

package() {
  cd "$srcdir/${_module_name}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 COPYING.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
