# Maintainer: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=rich-click
pkgver=1.6.1
pkgrel=1
pkgdesc="Python module to format click help output nicely with Rich."
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/ewels/rich-click"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-importlib-metadata')
makedepends=('python-setuptools')
source=("https://github.com/ewels/rich-click/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94cb58820b7728d00d0f6ea485a16e451c298e1cb496d37dcd707a4918ff0596')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
