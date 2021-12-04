# Maintainer: novenary <streetwalkermc@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-soco
pkgver=0.25.0
pkgrel=1
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict' 'python-ifaddr')
makedepends=('python-setuptools')
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
sha256sums=('283479afb35fcbbcadf58478475d58ecb1dc41e4124b6d87055a806396c0e93f')

build() {
  cd SoCo-$pkgver
  python setup.py build
}


package() {
  cd SoCo-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE.rst
}

# vim:set ts=2 sw=2 et:
