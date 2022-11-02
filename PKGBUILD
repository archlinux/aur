# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.3.18
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-netifaces' 'python-pyserial')
makedepends=('python-setuptools')
url="https://reticulum.network/"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('50a6cc3d020cf63d38da1c91e53dce6571368eaede5fc74afb478c03fb1232fa')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
