# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.3.15
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-netifaces' 'python-pyserial')
makedepends=('python-setuptools')
url="https://reticulum.network/"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('015b3de8c7c1cb5a50d478b39ae0d8b4e8cc1104c54c7e6ec5ec7162e4532228')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
