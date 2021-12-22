# Maintainer: Victor Bayas <victorsbayas at gmail dot com>

pkgname=envycontrol
pkgver=1.1
pkgrel=1
pkgdesc="Easy GPU switching for Nvidia Optimus laptops under Linux"
arch=(any)
url="https://github.com/geminis3/envycontrol"
license=(MIT)
depends=(python)
makedepends=(python-setuptools git)
source=("git+https://github.com/geminis3/envycontrol.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/envycontrol/"

  python setup.py install --root="$pkgdir/" --optimize=1

  # Copy package license to system
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}