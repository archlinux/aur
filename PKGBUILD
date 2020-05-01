# Maintainer: Niklas <dev@n1klas.net>

pkgname=python-pyhomematic
pkgver=0.1.66
pkgrel=1
pkgdesc="Python Interface to interact with Homematic devices"
arch=('any')
url="https://github.com/danielperna84/pyhomematic"
license=('MIT')
makedepends=('python-setuptools' 'git')
depends=('python')
source=("git+https://github.com/danielperna84/pyhomematic#tag=${pkgver}")
sha512sums=('SKIP')

build() {
  cd "$srcdir/pyhomematic"
  python setup.py build
}

package() {
  cd "$srcdir/pyhomematic"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
  
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
