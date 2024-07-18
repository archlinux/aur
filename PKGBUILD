# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-pytest-cases
pkgver=3.8.5
pkgrel=1
pkgdesc='Separate test code from test cases in pytest.'
url='https://smarie.github.io/python-pytest-cases/'
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-makefun python-decopatch)
license=('GPL2')
arch=('any')
source=("git+https://github.com/smarie/${pkgname}.git#tag=${pkgver}")
sha512sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/pytest_cases-${pkgver}-py2.py3-none-any.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
