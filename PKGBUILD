# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

pkgbase=python-mechanicalsoup
pkgname=(python-mechanicalsoup python2-mechanicalsoup)
pkgver=0.9.0
pkgrel=3
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('92c36db4edff18e76f6bfa359d0c8e123c047cb09ba18901939c83ae68efe39fa808b575f9627a12d0b8fb6dbfa89636f532dda30bc9c5e258143c2c42635c48')

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
