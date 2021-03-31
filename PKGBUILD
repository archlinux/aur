# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-soco
pkgver=0.21.3
pkgrel=1
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict' 'python-ifaddr')
makedepends=('python-setuptools')
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
sha256sums=('0e90af53d161460fa559e69c9fa15ad31addfbb7b91233b44348b84c6a6d9e84')

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
