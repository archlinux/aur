# Maintainer: Daniel Goß <developer@flashsystems.de>
pkgname=checkunits
pkgver=1.0
pkgrel=1
pkgdesc="Checks the systemd configuration and makes suggestions to optimize and repair it."
arch=(any)
url="https://github.com/FlashSystems/CheckUnits"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/FlashSystems/CheckUnits/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('783283ff66c0708697125de58a58099c')

package() {
  cd "CheckUnits-$pkgver"

  # These dependencies are only necessary at runtime
  depends+=('systemd>=239' 'bash>=4.4')

  install -Dm 755 'checkunits.sh' "$pkgdir/usr/bin/checkunits"
}
