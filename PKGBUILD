# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python-mechanicalsoup
pkgver=0.8.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('6f39ca77fc295af73a367cf635ab8c48403a78b3f06d1760591ad5635eb39572889684c061dadada0cbdcce02109d51a00d0303fbcd32490b59c1926ca8ec3d0')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py check
}

package() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py install --root "${pkgdir}" --optimize=1
}
