# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-simpy
_pkgname=${pkgname#python-}
pkgver=4.0.1
pkgrel=2
pkgdesc="Event discrete, process based simulation for Python."
url="http://simpy.readthedocs.org/en/latest/"
depends=('python')
makedepends=('python-setuptools' 'python-pip')
license=('MIT')
arch=('any')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('b36542e2faab612f861c5ef4da17220ac1553f5892b3583c67281dbe4faad404')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
