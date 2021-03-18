# Maintainer: Paul Irofti <paul@irofti.net>

_name=tamu_axolotl
pkgname="python-$_name-git"
pkgver=r11.3a861e7
pkgrel=1

pkgdesc="Automated Time-series Outlier Detection System"
url="https://github.com/tods-doc/axolotl"
arch=('any')
license=('Apache')

depends=('python' 'python-tamu_d3m' 'python-grpcio' 'python-grpcio-tools'
  'python-grpcio-testing' 'python-ray' 'python-networkx')
makedepends=('git' 'python-setuptools')
provides=('python-tamu_axolotl')
conflicts=('python-tamu_axolotl')

source=("git+https://github.com/tods-doc/axolotl")
md5sums=('SKIP')

pkgver() {
  cd "axolotl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "axolotl"
  python setup.py build
}

package() {
  cd "axolotl"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim:ts=2:sw=2:et:
