# Maintainer:  Popolon <popolon (oL popolon d.t org>

pkgname=cjit
pkgver=1.1.2
pkgrel=1
pkgdesc=" C Just In Time, interpreter and compiler "
url='https://dyne.org/cjit/'
arch=($CARCH)
license=('GPL-3.0-or-later')
depends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dyne/cjit/archive/refs/tags/v1.1.2.tar.gz")
sha256sums=('be76e54bc3d14dc703691c61ad68da5015c7fb19cf9da59182bd0e39143c558a')


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX=/usr linux
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 LICENSES/GPL-3.0-or-later.txt "${pkgdir}/usr/share/licenses/${pkgname}/GPL-3.0-or-later.txt"
}
