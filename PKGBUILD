# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.1.9
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('x86_64')
url='https://ax.dev'
license=('MIT')
depends=('python' 'python-botorch' 'python-jinja' 'python-pandas' 'python-scipy'
'python-scikit-learn' 'python-plotly')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/facebook/Ax/archive/$pkgver.tar.gz")
sha256sums=('2de992e042aca36b9ea6b7ce392c881180f57b0d0b6de34b360277a44cbce2e0')

_pkgname=Ax

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
