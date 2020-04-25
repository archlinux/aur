# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.1.11
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
sha256sums=('3d83eb005fa48f3444a0eb82329326cb0417c8d2619dd9b9039c1296fc37f939')

_pkgname=Ax

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
