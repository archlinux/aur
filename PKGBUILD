# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remt'
pkgdesc="reMarkable tablet command-line tools."
pkgver=0.6.0
pkgrel=1
url="https://gitlab.com/wrobell/remt"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-asyncio-contextmanager')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('99f4b1ab018b50ae49bb7444533f6d70')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
