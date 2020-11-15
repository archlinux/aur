# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-bitbox02
_pkgname=py-bitbox02
_gitname=bitbox02-firmware-py-bitbox02
pkgver=5.0.0
pkgrel=1
pkgdesc="Python code to communicate with BitBox02 cryptocurrency wallet"
arch=('any')
depends=('python' 'bitbox-udev' 'python-tzlocal' 'python-pyserial' 'python-requests' 'python-base58' 'python-semver' 'python-noiseprotocol-git')
makedepends=()
url="https://github.com/digitalbitbox/bitbox02-firmware"
license=('Apache')
options=('!emptydirs')
source=(https://github.com/digitalbitbox/bitbox02-firmware/archive/$_pkgname-$pkgver.tar.gz)
sha256sums=('90497a73a90307178470f9f36e8bfdb5b79ef103c2ae5ca7db332472a55ab7ba')

build() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
