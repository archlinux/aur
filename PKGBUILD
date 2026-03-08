# Maintainer: pisevren <aur@local>

pkgname=librevna-firmware
pkgver=1.6.5
pkgrel=1
pkgdesc="Firmware files for LibreVNA hardware revision B"
arch=('any')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')
makedepends=('unzip')
install=librevna-firmware.install
backup=('etc/xdg/LibreVNA/LibreVNA-GUI.conf')

source=(
  "https://github.com/jankae/LibreVNA/releases/download/v${pkgver}/EmbeddedFirmware-hw-rev-B-v${pkgver}.zip"
  "LibreVNA-GUI.conf"
  "README"
)
sha256sums=('caadb7eebb2e8856316ce3044360c55dab84464aafa489705f55cc451451eaeb'
            '593615b27408ea8b0ad9dd18c709ff056206f3f2f0c16db99d5efe726b1f5f2b'
            'c8e8bf86bdeb7f215a74fefceb60db0efff6d255fb656af2955651e5b3580a9a')

package() {
  install -Dm644 \
    "$srcdir/combined.vnafw" \
    "$pkgdir/usr/share/librevna/firmware/combined.vnafw"

  install -Dm644 \
    "$srcdir/VNA_embedded.elf" \
    "$pkgdir/usr/share/librevna/firmware/VNA_embedded.elf"

  install -Dm644 \
    "$srcdir/LibreVNA-GUI.conf" \
    "$pkgdir/etc/xdg/LibreVNA/LibreVNA-GUI.conf"

  install -Dm644 \
    "$srcdir/README" \
    "$pkgdir/usr/share/doc/$pkgname/README"
}
