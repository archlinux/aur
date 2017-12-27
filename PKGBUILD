# Maintainer: basxto <archlinux basxto de>

pkgname=gbm
pkgver=1.0.5
pkgrel=1
pkgdesc="Game Backup Monitor monitors games and backs up their savegames"
url="https://mikemaximus.github.io/gbm-web/linux.html"
license=('GPL3')
arch=('any')
makedepends=('imagemagick')
depends=('mono-basic' 'sqlite' 'p7zip')
install=$pkgname.install
source=("https://github.com/MikeMaximus/gbm/releases/download/v${pkgver}/GBM.v${pkgver}.32-bit.7z"
        'makefile'
        'gbm.sh')
sha256sums=('e71f8ecfd7432a055abdea9e4198cdf39aff22ccba1440ad8e5d47064f2d2dc3'
            'b669167553a07f059b03b3fa060ebcc6df9c6a783bbadecdd9ec59c72a911166'
            '197f53f52d269ad978489f05560c9c0e628cb7a2abd4d57017f6e2f89a1ff723')
PKGEXT=".pkg.tar"

package() {
  make -C ${srcdir} install DESTDIR="${pkgdir}/" PREFIX=/usr
}
