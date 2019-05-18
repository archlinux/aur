# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
repo=heitzmann
modname=gdspy
pkgname=python-${modname}
pkgver=1.4
pkgrel=1
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/${repo}/${modname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/${repo}/${modname}/archive/v${pkgver}.tar.gz")
sha256sums=('030927a71685262160b87491b0ad9a500c4f3d915db0fdca9a1d6129b91ef810')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
