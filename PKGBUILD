# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaël Donval <gdonval+aur at google mail>


pkgbase='python-toolz'
pkgname=('python-toolz' 'python-cytoolz')
pkgver=0.9.0
pkgrel=2
pkgdesc="A set of utility functions for iterators, functions, and dictionaries."
arch=('any')
url="https://github.com/pytoolz"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
conflict=('python-cytoolz')
source=("https://pypi.org/packages/source/t/toolz/toolz-${pkgver}.tar.gz"
        "https://github.com/pytoolz/cytoolz/archive/${pkgver}.tar.gz")
sha256sums=('929f0a7ea7f61c178bd951bdae93920515d3fbdbafc8e6caf82d752b9b3b31c9'
            '177d6bcf76d60efeb5fa04c151e8c2e53a2679d380f1d316b0fd3a1cdffd75fb')

package_python-toolz() {
  cd "${srcdir}"/toolz-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-toolz/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/python-toolz/README"
}

package_python-cytoolz() {
  cd "${srcdir}"/cytoolz-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-cytoolz/LICENSE"
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/python-cytoolz/README"
}

# vim:ts=2:sw=2:et:
