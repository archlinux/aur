# Maintainer: robertfoster

_name=sha3
pkgname=python-${_name}
pkgver=0.2.1 # renovate: datasource=github-tags depName=bjornedstrom/python-sha3
pkgrel=1
pkgdesc="A Python module that implements SHA-3 (Keccak) with a hashlib-like interface"
arch=('i686' 'x86_64')
url="https://github.com/bjornedstrom/python-sha3"
license=('PSF')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/s/sha3/sha3-$pkgver.tar.gz")

build() {
  cd $srcdir/${_name}-$pkgver
  python setup.py build
}
package() {
  cd $srcdir/${_name}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
}

sha256sums=('4e47ae8a86c205d51f15a16b4cb875c1c01fa133a9b3715411d0874fc80cafdb')
