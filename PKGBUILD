# Maintainer: Marek Küthe <m.k@mk16.de>

_pkgname=ripe-atlas-sagan
pkgname=python-$_pkgname
pkgver=1.3.1
pkgrel=1
pkgdesc="parsing library for RIPE Atlas measurement results "
arch=('x86_64')
url="https://github.com/RIPE-NCC/ripe-atlas-sagan"
license=('GPL-3.0-or-later')
depends=('python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RIPE-NCC/ripe-atlas-sagan/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=(aac4f06a6a9e0d189128b9ed21ab7119fb24d228bcd1d18bef6b9ec029635b478eb6cb5992e2ae7dfe65def8c6f2199bc43d9e1862591070ced7b734e1ed3e37)

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

