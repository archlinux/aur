# Maintainer: hexchain <i@hexchain.org>

_pypiname=requirements-parser
pkgbase=python-$_pypiname
pkgname=(python-$_pypiname python2-$_pypiname)
pkgdesc="A Pip requirements file parser"
pkgver=0.1.0
pkgrel=2
license=('BSD')
makedepends=(python-setuptools python2-setuptools)
source=("https://github.com/davidfischer/requirements-parser/archive/v$pkgver.tar.gz")
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
sha256sums=('16bf5cecefdb24b1c912516297be65128ce3d2ecff9a09e6c8b93177b6650356')
