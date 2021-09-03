# Maintainer: Avinash R <nashpapa at gmail dot com>

pkgname=input-device-indicator
pkgver=0.1.0
pkgrel=1
pkgdesc='Creates an indicator to allow us to disable some input devices'
arch=('any')
url="https://github.com/brandizzi/input-device-indicator"
license=('GPL')
depends=('python' 'xorg-xinput')
makedepends=('python-setuptools')
source=("${pkgname}"-"${pkgver}".tar.gz::${url}/archive/v$pkgver.tar.gz)
sha512sums=('7b23f098e3a074e763addc04c62a3ff760e371e06ca5f1da73607cacd5780c2301ecc6786705e426ce6268124b4d3eb230516cd66fff8bf14d522b7cc6f5fc00')
conflicts=()
_license_file=LICENSE.txt

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 $_license_file "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
