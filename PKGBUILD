# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-ax-platform
pkgver=0.1.20
pkgrel=1
pkgdesc='Adaptive Experimentation Platform'
arch=('x86_64')
url='https://ax.dev'
license=('MIT')
depends=('python' 'python-botorch' 'python-jinja' 'python-pandas' 'python-scipy'
'python-scikit-learn' 'python-plotly' 'python-typeguard')
optdepends=()
makedepends=('python' 'python-setuptools')
source=("$pkgname-$pkgver::https://github.com/facebook/Ax/archive/v$pkgver.tar.gz")
sha256sums=('be40948a6dcd38b9ab3fe182d66d8a234cd016acdced1cf424730a84692b79cb')

_pkgname=Ax

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
