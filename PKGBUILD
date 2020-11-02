# Maintainer: Bet4 <bet4it@gmail.com>

_pkgname=stackprinter
pkgname=python-$_pkgname
pkgver=0.2.5
pkgrel=1
pkgdesc="Debugging-friendly exceptions for Python"
arch=('any')
url="https://github.com/cknd/stackprinter"
license=('MIT')
depends=('python')
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e0197c54dafe7867020731c3dcab96a14d103c1e39130fa0b5159a2f0af427b6')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
