# Maintainer: Cristóbal Tapia <crtapia at gmali dot com>

pkgname="python-wofi"
pkgver=0.3.1
pkgrel=1
pkgdesc='A Python module to make simple GUIs with Wofi'
url='https://github.com/cristobaltapia/python-wofi'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('uv')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cristobaltapia/python-wofi/archive/v${pkgver}.tar.gz")
sha256sums=('3c7e780fa5a2e837e34582fba0d7947ddc49809879ad4afd075ad118dd723968')

build() {
  cd "$pkgname-$pkgver"
  uv build
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ft=sh ts=2 sw=2 et:
