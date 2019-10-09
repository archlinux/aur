pkgname=python-libnmap
pkgver=0.7.0
pkgrel=1
pkgdesc="Python NMAP library enabling you to start async nmap tasks, parse and compare/diff scan results. Python 3 version from PyPi"
arch=('any')
url="https://github.com/savon-noir/python-libnmap"
license=('CCPL')
depends=('python')
optdepends=('python-sqlalchemy' 'python-pymongo' 'python-boto')
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d14919142395aaca952e129398f0c7371c0f0a034c63de6dad99cd7050177ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build

  cd "$srcdir"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
}
