# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=(python-rchitect python2-rchitect)
_pkgname=${pkgname#python-}
pkgver=0.2.4
pkgrel=1
pkgdesc="Minimal R API for Python"
url="https://github.com/randy3k/rapi"
arch=('i686' 'x86_64')
license=('MIT')
depends=('r>3.4.0' 'python-multipledispatch')
makedepends=('python-setuptools')
#replaces=('python-rapi')
source=("https://github.com/randy3k/rchitect/archive/v$pkgver.tar.gz")
sha256sums=('122e81c69bf73411b8b1ee021684e0e56d944f1b857102e455831a13ff79f0c8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package_python-rchitect() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-rchitect() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
}
