# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remt'
pkgdesc="reMarkable tablet command-line tools."
pkgver=0.10.1
pkgrel=1
url="https://gitlab.com/wrobell/remt"
arch=('any')
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
#depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-asyncio-contextmanager' 'python-iterfzf' 'python-getmac')
depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-iterfzf' 'python-getmac')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ff4af296d4c46b22789ce97ecfadd1da')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
