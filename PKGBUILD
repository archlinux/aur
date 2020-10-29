# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remt'
pkgdesc="reMarkable tablet command-line tools."
pkgver=0.9.0
pkgrel=1
url="https://gitlab.com/wrobell/remt"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
#depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-asyncio-contextmanager' 'python-iterfzf' 'python-getmac')
depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-iterfzf' 'python-getmac')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b971f22837dd797862ec66b94caf0720')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
