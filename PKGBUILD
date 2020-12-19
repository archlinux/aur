pkgname=python-libnmap
pkgver=0.7.2
pkgrel=1
pkgdesc="Python NMAP library enabling you to start async nmap tasks, parse and compare/diff scan results. Python 3 version from PyPi"
arch=('any')
url="https://github.com/savon-noir/python-libnmap"
license=('CCPL')
depends=('python')
optdepends=('python-sqlalchemy' 'python-pymongo' 'python-boto')
source=("https://files.pythonhosted.org/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('73309abebc49881adc312b85d7169bb567ac259948d2b1ce7b962e21bc5f98ea')

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
