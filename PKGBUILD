# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-makefun
pkgver=1.15.0
pkgrel=1
pkgdesc='Dynamically create python functions with a proper signature.'
url='https://smarie.github.io/python-makefun/'
makedepends=(python-build python-installer python-wheel python-setuptools-scm)
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
