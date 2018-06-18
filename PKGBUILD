# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaël Donval <gdonval+aur at google mail>


pkgbase='python-toolz'
pkgname='python-toolz'
pkgver=0.9.0
pkgrel=1
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://github.com/pytoolz"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/t/toolz/toolz-${pkgver}.tar.gz"
        "toolz_LICENSE::https://github.com/pytoolz/toolz/raw/master/LICENSE.txt")
sha256sums=('929f0a7ea7f61c178bd951bdae93920515d3fbdbafc8e6caf82d752b9b3b31c9'
            '053664057b295b2f0c1332291a77102f01a099d87926e449e08a117eea9660bf')

package_python-toolz() {
  install -D -m644 toolz_LICENSE "${pkgdir}/usr/share/licenses/python-toolz/LICENSE"
  cd "${srcdir}"/toolz-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/python-toolz/README"
}

# vim:ts=2:sw=2:et:
