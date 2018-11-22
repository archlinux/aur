#Maintainer: Carlos Franke <carlos_franke at carlosfranke dot net>
#Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname=bdflib
pkgname=python-$_pkgname
pkgver=1.1.1
pkgrel=1
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
url="https://gitlab.com/Screwtapello/bdflib"
arch=('any')
license=('GPL3')
depends=('python')
conflicts=("python2-bdflib" "bdflib-git")
provides=("bdflib")
options=(!emptydirs)
source=('https://files.pythonhosted.org/packages/3a/e8/1ff1747cdd39c29c966208a2b54b157aef631803622d4bb9b3b0f35b0acb/bdflib-1.1.1.tar.gz')
sha256sums=('b724a316b4a5169edd8f997c9259bbb1b8307dcff2244b26263a95133e268b90')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

