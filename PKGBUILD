# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=(python-socks python2-socks)
_pkgname=PySocks
pkgver=1.6.8
pkgrel=1
pkgdesc="SOCKS4, SOCKS5 or HTTP proxy (Anorov fork PySocks replaces socksipy)"
arch=('any')
license=('BSD')
url="https://github.com/Anorov/PySocks"
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python-psutil'
              'python2-pytest' 'python2-psutil')
provides=('python-socksipy-branch')
conflicts=('python-socksipy-branch')
replaces=('python-socksipy-branch')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a7f32ce1ac2b3467b793fdf14b23ad2b3ae139bcb10b6331fdecdae97ac6b821')

# python{,2}-test_server (or test-server?) not on AUR
# check() {
#   python setup.py test
#   python2 setup.py test
# }

package_python-socks() {
  depends=('python')

  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-socks() {
  depends=('python2')

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
