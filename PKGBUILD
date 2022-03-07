# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-bitbox02
_pkgname=py-bitbox02
_gitname=bitbox02-firmware-py-bitbox02
pkgver=6.0.0
pkgrel=1
pkgdesc="Python code to communicate with BitBox02 cryptocurrency wallet"
arch=('any')
depends=('python' 'bitbox-udev' 'python-tzlocal' 'python-pyserial' 'python-requests' 'python-base58' 'python-semver' 'python-noiseprotocol-git')
makedepends=()
url="https://github.com/digitalbitbox/bitbox02-firmware"
license=('Apache')
options=('!emptydirs')
source=(https://github.com/digitalbitbox/bitbox02-firmware/archive/$_pkgname-$pkgver.tar.gz)
sha256sums=('c6696f9942a4e973ef6183f4ba8e2e55db8b5301a640803a8366f1f0f6f70c0f')

build() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
