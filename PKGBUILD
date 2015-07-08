# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-fixtures
pkgver=0.3.14
pkgrel=1
pkgdesc="Fixtures, reusable state for writing clean tests and more."
url="https://launchpad.net/python-fixtures"
depends=('python' 'python-testtools')
makedepends=('python-setuptools' )
license=('BSD' 'Apache')
arch=('any')
source=("http://pypi.python.org/packages/source/f/fixtures/fixtures-$pkgver.tar.gz")
md5sums=('c63c79c87405dbdc8e0f877c3ff583fd')

build() {
    cd "$srcdir/fixtures-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/fixtures-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    local license_dir="$pkgdir/usr/share/doc/$pkgname/"
    install -D -m644 "COPYING" "$license_dir/COPYING"
    install -D -m644 "BSD" "$license_dir/BSD"
}

