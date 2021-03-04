# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-soco
pkgver=0.21.2
pkgrel=2
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict')
makedepends=('python-setuptools')
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
sha256sums=('2aec1c6bf0b3e1bf1ad70c6916a9183645ba51d26f78917d8369269df68167a4')

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
