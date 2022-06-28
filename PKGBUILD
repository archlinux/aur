# Maintainer: GI Jack <GI_Jack@hackermail.com>\

pkgname=python-rich-click
_pkgname=rich-click
pkgver=1.5.1
pkgrel=1
pkgdesc="Python module to format click help output nicely with Rich."
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/ewels/rich-click"
license=('MIT')
depends=('python' 'python-click' 'python-rich' 'python-importlib-metadata')
makedepends=('python-setuptools')
source=("https://github.com/ewels/rich-click/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9328b3f65cf79a4ee912f48f2229217989f470d41cc5b634e26cf98939c1f22d')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
