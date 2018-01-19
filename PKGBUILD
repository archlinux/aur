# Maintainer: hexchain <i@hexchain.org>

_pypiname=requirements-parser
pkgbase=python-$_pypiname
pkgname=(python-$_pypiname python2-$_pypiname)
pkgdesc="A Pip requirements file parser"
pkgver=0.2.0
pkgrel=1
license=('BSD')
makedepends=(python-setuptools python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/r/$_pypiname/$_pypiname-$pkgver.tar.gz")
arch=(any)

build() {
    cd "$srcdir"
    cp -r "$_pypiname-$pkgver" "$_pypiname-$pkgver-py2"
}

package_python-requirements-parser() {
    depends=("python")
    cd "$srcdir/$_pypiname-$pkgver"
    python setup.py install --prefix="/usr" --root="$pkgdir" -O1
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_python2-requirements-parser() {
    depends=("python2")
    cd "$srcdir/$_pypiname-$pkgver-py2"
    python2 setup.py install --prefix="/usr" --root="$pkgdir" -O1
    install -Dm644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname"
}
sha256sums=('5963ee895c2d05ae9f58d3fc641082fb38021618979d6a152b6b1398bd7d4ed4')
