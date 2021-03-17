# Maintainer: Paul Irofti <paul@irofti.net>
_name=jsonpath-ng
pkgname="python-$_name"
pkgver=1.5.2
pkgrel=1
pkgdesc="JSONPath for Python that aims to be standard compliant"
arch=('any')
url="https://github.com/h2non/jsonpath-ng"
license=('Apache')
depends=('python' 'python-ply' 'python-decorator' 'python-six')
makedepends=('python-setuptools')
#source=("https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/c5/d0/c4b2fa7e00e69670a92b103761b4e10a4bdaca109818d44753219c20b7be/${_name}-${pkgver}.tar.gz")
sha256sums=('144d91379be14d9019f51973bd647719c877bfc07dc6f3f5068895765950c69d')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
