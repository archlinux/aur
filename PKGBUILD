# Maintainer: Aaron DeVore <aaron.devore@gmail.com>

pkgname=(python-fixtures python2-fixtures)
pkgver=1.3.1
pkgrel=1
pkgdesc="Fixtures, reusable state for writing clean tests and more."
url="https://launchpad.net/python-fixtures"
makedepends=(python-setuptools python2-setuptools)
license=('BSD' 'Apache')
arch=('any')
source=("http://pypi.python.org/packages/source/f/fixtures/fixtures-$pkgver.tar.gz")
md5sums=('72959be66e26b09641a1e3902f631e62')

package_python-fixtures() {
    depends=('python' 'python-testtools')
    cd "$srcdir/fixtures-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
    local license_dir="$pkgdir/usr/share/doc/$pkgname/"
    install -D -m644 "COPYING" "$license_dir/COPYING"
    install -D -m644 "BSD" "$license_dir/BSD"
}

package_python2-fixtures() {
    depends=('python2' 'python2-testtools')
    cd "$srcdir/fixtures-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1 
    local license_dir="$pkgdir/usr/share/doc/$pkgname/"
    install -D -m644 "COPYING" "$license_dir/COPYING"
    install -D -m644 "BSD" "$license_dir/BSD"
}

