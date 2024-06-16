# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname=python-gnureadline
pkgver=8.2.10
pkgrel=1
pkgdesc="The standard Python readline extension statically linked against the GNU readline library."
url="https://pypi.org/project/gnureadline/"
arch=('any')
license=('GPL-3.0-or-later')
_name="gnureadline"
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/gnureadline/gnureadline-$pkgver.tar.gz")
sha256sums=('a746ba98d4de37b079e42d949b704c33c168b30bd1f9071a1d25c9da9a449997')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
