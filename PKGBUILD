# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=mwa_hyperdrive-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Calibration software for the Murchison Widefield Array radio telescope"
arch=('x86_64')
url="https://github.com/MWATelescope/mwa_hyperdrive"
license=('MPL-2.0')
depends=('glibc' 'libgcc' 'libstdc++')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/mwa_hyperdrive-v${pkgver}-Linux-x86-64-v2.tar.gz")
sha256sums_x86_64=('9cc5c7b6a552e8d7ff90bec1eb9a128d2d378c94f2039408c2f756c101657c01')

package() {
  install -Dm755 "hyperdrive" "${pkgdir}/usr/bin/hyperdrive"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "COPYING-hdf5" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-erfa" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-cfitsio" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
