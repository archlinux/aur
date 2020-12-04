# Maintainer: Alex Forencich <alex@alexforencich.com>
pkgname=python-pytest-split
pkgver=0.1.5
pkgrel=1
pkgdesc="Pytest plugin which splits the test suite based on test execution time."
arch=('any')
url="https://github.com/jerry-git/pytest-split"
license=('MIT')
depends=('python-pytest')
makedepends=('python-setuptools-scm')

_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bf0163aafe5686e917a7f043567af96c50fabfe1ba0aa3be0f1b65556e09aa3c')

build() {
    cd "$srcdir/pytest-split-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pytest-split-$pkgver"
    python setup.py install --skip-build --prefix=/usr --root="$pkgdir/" --optimize=1
    install -m 644 -D ./LICENCE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENCE
}
