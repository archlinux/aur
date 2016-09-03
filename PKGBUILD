# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaël Donval <gdonval+aur at google mail>


pkgbase='python-toolz'
pkgname='python-toolz'
pkgver=0.8.0
pkgrel=2
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://github.com/pytoolz"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/t/toolz/toolz-${pkgver}.tar.gz"
        "toolz_LICENSE::https://github.com/pytoolz/toolz/raw/master/LICENSE.txt")
sha256sums=('e8451af61face57b7c5d09e71c0d27b8005f001ead56e9fdf470417e5cc6d479'
            'SKIP')

package_python-toolz() {
  install -D -m644 toolz_LICENSE "${pkgdir}/usr/share/licenses/python-toolz/LICENSE"
  cd "${srcdir}"/toolz-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/python-toolz/README"
}

# vim:ts=2:sw=2:et:
