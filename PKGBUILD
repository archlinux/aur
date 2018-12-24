# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgbase=python-mechanicalsoup
pkgname=(python-mechanicalsoup python2-mechanicalsoup)
pkgver=0.11.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('d45303523d46e241769ca763d970044c8eee5278e4546720b3b2088577e05ffd269a1e40fd53168894906d3ee75b441f5591e162fa0d39ceea9f479283135f5e')

check() {
  cd $srcdir/MechanicalSoup-$pkgver 
  python3 setup.py check
}

package_python2-mechanicalsoup() {
  depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-six' 'python2-lxml')
  cd $srcdir/MechanicalSoup-$pkgver 

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-mechanicalsoup() {
  depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-six' 'python-lxml')
  cd $srcdir/MechanicalSoup-$pkgver 

  python setup.py install --root="$pkgdir/" --optimize=1
}
