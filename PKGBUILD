# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python-mechanicalsoup
pkgver=0.9.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('92c36db4edff18e76f6bfa359d0c8e123c047cb09ba18901939c83ae68efe39fa808b575f9627a12d0b8fb6dbfa89636f532dda30bc9c5e258143c2c42635c48')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py check
}

package() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py install --root "${pkgdir}" --optimize=1
}
