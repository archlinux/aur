# Maintainer: Gaël Donval <gdonval+aur at google mail>
# Contributor: Gaël Donval <gdonval+aur at google mail>


pkgbase='python-cytoolz'
pkgname='python-cytoolz'
pkgver=0.8.0
pkgrel=3
pkgdesc="A high performance Cython implementation of Toolz functional utilities."
arch=('i686' 'x86_64')
url="https://github.com/pytoolz"
license=('BSD')
depends=('python' "python-toolz=$pkgver")
makedepends=('python-setuptools' 'cython>=0.17')
source=("https://pypi.org/packages/source/c/cytoolz/cytoolz-${pkgver}.tar.gz"
        "cytoolz_LICENSE::https://github.com/pytoolz/cytoolz/raw/master/LICENSE.txt")
sha256sums=('2239890c8fe2da3eba82947c6a68cfa406e5a5045911c9ab3de8113462372629'
            'SKIP')

package_python-cytoolz() {
  install -D -m644 cytoolz_LICENSE "${pkgdir}/usr/share/licenses/python-cytoolz/LICENSE"
  cd "${srcdir}"/cytoolz-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/python-cytoolz/README"
}

# vim:ts=2:sw=2:et:
