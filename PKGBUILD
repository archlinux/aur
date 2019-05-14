#Maintainer: Carlos Franke <carlos_franke at carlosfranke dot net>
#Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=bdflib
pkgname=python2-$_pkgname
pkgver=1.1.3
pkgrel=1
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
url="https://gitlab.com/Screwtapello/bdflib"
arch=('any')
license=('GPL3')
depends=('python2')
conflicts=("python3-bdflib" "bdflib-git")
provides=("bdflib")
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/87/3c/5d094c3299834546d361ec09f1a209d75efef50c2c8c51e31e61ec1c5f0a/bdflib-1.1.3.tar.gz')
sha256sums=('aa3f3ad5fb459f8d85fbfb19896116678a77b4c6fd689d3f1ba54bd868337641')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

