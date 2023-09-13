# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.5.8
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-pyserial')
makedepends=('python-setuptools')
provides=('rnodeconf')
conflicts=('rnodeconf')
url="https://reticulum.network/"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('753e433b0f50a1710bb5da67b4b9cddf4f5e22c56d8f6f49d16c8d3f1d298043')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
