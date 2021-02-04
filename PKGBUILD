# Maintainer: Your Name <youremail@domain.com>
_pkgname=crcmod
pkgname=python2-crcmod
pkgver=1.7
pkgrel=2
pkgdesc="Cyclic Redundancy Check (CRC) implementation in Python."
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/crcmod/"
license=('MIT')
groups=()
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/c/$_pkgname/$_pkgname-${pkgver}.tar.gz")
md5sums=(2d5b92117d958dcead94f9e17f54cd32)

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
