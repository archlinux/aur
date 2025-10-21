# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=python-gnureadline
pkgver=8.2.13
pkgrel=1
pkgdesc="The standard Python readline extension statically linked against the GNU readline library."
url="https://pypi.org/project/gnureadline/"
arch=('any')
license=('GPL-3.0-or-later')
_name="gnureadline"
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/gnureadline/gnureadline-$pkgver.tar.gz")
sha256sums=('c9b9e1e7ba99a80bb50c12027d6ce692574f77a65bf57bc97041cf81c0f49bd1')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
