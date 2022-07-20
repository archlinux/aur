# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-bitbox02
_pkgname=py-bitbox02
_gitname=bitbox02-firmware-py-bitbox02
pkgver=6.1.0
pkgrel=1
pkgdesc="Python code to communicate with BitBox02 cryptocurrency wallet"
arch=('any')
depends=('python' 'bitbox-udev' 'python-tzlocal' 'python-pyserial' 'python-requests' 'python-base58' 'python-semver' 'python-noiseprotocol-git')
makedepends=()
url="https://github.com/digitalbitbox/bitbox02-firmware"
license=('Apache')
options=('!emptydirs')
source=(https://github.com/digitalbitbox/bitbox02-firmware/archive/$_pkgname-$pkgver.tar.gz)
sha256sums=('65dbd89eec4039e117ed420a58e63c6ed9cac173d04e16c050dc57620301bc1a')

build() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py build
}

package() {
  cd "$srcdir/$_gitname-$pkgver/py/bitbox02"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
