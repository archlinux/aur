# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=python-rns
_name='rns'
pkgver=0.3.14
pkgrel=1
pkgdesc="Self-configuring, encrypted and resilient mesh networking stack"
arch=('any')
depends=('python-cryptography' 'python-netifaces' 'python-pyserial')
makedepends=('python-setuptools')
url="https://reticulum.network/"
license=('MIT')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('596541f13fd3b8c78f853eaa8374ba3a0d0995fbb033c42a82f30ac03d8955e3')

build() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}
