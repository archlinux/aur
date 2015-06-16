# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
pkgname=python-editrepl
pkgver=2013.06.20
pkgrel=1
pkgdesc="Runs a terminal based editor inside your REPL session"
arch=(any)
url="https://github.com/philipbjorge/EditREPL"
license=('custom: BSD')
makedepends=('python' 'python-setuptools')

source=("https://pypi.python.org/packages/source/E/EditREPL/EditREPL-$pkgver.tar.gz")
sha256sums=('2cf966b27768389c82d4197a1df9c37c2b25ac6c4a019468168e93069637fdbb')

build() {
    cd "$srcdir/EditREPL-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/EditREPL-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
