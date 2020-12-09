# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.1.19
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
sha256sums=('24a68870286a10e856ce726b86df55ea76da23e681940301b04ae4884b197642')

_pkgname=Ax

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
