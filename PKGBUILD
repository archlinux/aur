# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-pytest-cases
pkgver=3.6.13
pkgrel=2
pkgdesc='Separate test code from test cases in pytest.'
url='https://smarie.github.io/python-pytest-cases/'
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
depends=(python-makefun)
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
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
