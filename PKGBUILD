# Maintainer: Biswapriyo Nath <nathbappai@gmail.com>

pkgname=python-plots
pkgver=0.5.1
pkgrel=1
pkgdesc="A graph plotting app for GNOME"
arch=(any)
url="https://github.com/alexhuntley/Plots"
license=('GPL-3.0')
depends=(python python-gobject python-opengl python-jinja python-numpy python-lark-parser)
makedepends=(python-setuptools)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/alexhuntley/Plots/archive/v${pkgver}.tar.gz")
sha256sums=('d05b68fae27adff4d862ee1194bb6adf9116b50c45772d70a012d9ca000214ad')

build() {
  cd Plots-${pkgver}
  python setup.py build
}

package() {
  cd Plots-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 COPYING -t "${pkgdir}"/usr/share/licenses/${pkgname}
}

