# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Contributer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgname=python-mechanicalsoup
pkgver=0.7.0
pkgrel=1
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
sha512sums=('3311bd3a45db5235b5798b1d995bb4d6dc5df5b5acdad45ee4f6b6c0fa0230b793cd258c23fa7b6be1987d1f09a695803080014624f4ae6042bf1f987460a78c')

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py check
}

package() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py install --root "${pkgdir}" --optimize=1
}
