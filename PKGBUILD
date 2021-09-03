# Maintainer: novenary <streetwalkermc@gmail.com>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=python-soco
pkgver=0.24.0
pkgrel=1
pkgdesc="A simple Python class that allows you to programmatically control Sonos speakers"
arch=('any')
url="https://github.com/SoCo/SoCo"
license=('MIT')
depends=('python' 'python-requests' 'python-xmltodict' 'python-ifaddr')
makedepends=('python-setuptools')
source=("SoCo-$pkgver.tar.gz::https://github.com/SoCo/SoCo/archive/v$pkgver.tar.gz")
sha256sums=('023212e3281366e8ab0f3bf1ebc3aa00e68939fc4469940c700e832cd13f3488')

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
