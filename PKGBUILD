#Maintainer: Carlos Franke <carlos_franke at carlosfranke dot net>
#Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=bdflib
pkgname=python2-$_pkgname
pkgver=1.0.4
pkgrel=2
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
url="https://gitlab.com/Screwtapello/bdflib"
arch=('any')
license=('GPL3')
depends=('python2')
conflicts=("python3-bdflib" "bdflib-git")
provides=("bdflib")
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/57/0b/f0ac3a1160e3a0e9f6c37edae17fdcbcfa6a6b5d6973adcc0eb27252cd60/bdflib-v1.0.4.tar.gz')
sha256sums=('ad5b19ed6cff5d5b7bec4f78f92747212b0b141ff3cc234b2a6e0d0ca46d8959')

build() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-v$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

