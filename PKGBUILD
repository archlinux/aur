# Maintainer: Gustavo Jasso <gustavo at jasso dot info>
pkgname='remt'
pkgdesc="reMarkable tablet command-line tools."
pkgver=0.5.2
pkgrel=1
url="https://gitlab.com/wrobell/remt"
arch=('any')
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-gobject' 'python-cairo' 'python-asyncssh' 'python-cytoolz' 'python-asyncio-contextmanager')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('914f5ba3e001167d693c183d124a88bf')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
