# Maintainer: Jonathan Arnold <jdarnold@archlinux.us>
# Contributor: Zhang Hai <dreaming.in.code.zh@gmail.com>

_pkgname="MechanicalSoup"
pkgbase=python-mechanicalsoup
pkgname=('python2-mechanicalsoup' 'python-mechanicalsoup')
pkgver=0.3.1
pkgrel=5
pkgdesc="A Python library for automating interaction with websites"
arch=('any')
url="https://github.com/hickford/MechanicalSoup"
license=('MIT')
depends=( )
makedepends=('python-setuptools')
source=("https://github.com/hickford/MechanicalSoup/archive/v${pkgver}.tar.gz")
md5sums=('fe5855a6a8b8e07691e29e25e4f0ef0d')

build() {
  cd $srcdir
  cp -r ${_pkgname}-$pkgver ${_pkgname}2-$pkgver
}

check() {
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py check

  cd $srcdir/${_pkgname}2-$pkgver 
  python2 setup.py check
}

package_python-mechanicalsoup() {
  depends=('python' 'python-beautifulsoup4' 'python-requests' 'python-six')
  cd $srcdir/${_pkgname}-$pkgver 
  python3 setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-mechanicalsoup() {
  depends=('python2' 'python2-beautifulsoup4' 'python2-requests' 'python2-six')
  cd $srcdir/${_pkgname}2-$pkgver 
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

