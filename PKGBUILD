# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.1.18
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('x86_64')
url='https://ax.dev'
license=('MIT')
depends=('python' 'python-botorch' 'python-jinja' 'python-pandas' 'python-scipy'
'python-scikit-learn' 'python-plotly' 'python-typeguard')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/facebook/Ax/archive/$pkgver.tar.gz")
sha256sums=('e2e3d9be51d2572f24673299718a79004d2ab99c1b119685db7a79e69ed9659a')

_pkgname=Ax

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
