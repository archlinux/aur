# Maintainer: Tinu Weber <https://gnugen.ch/~mtweber>

pkgname=epfl-printers
pkgver=2019.04.26
pkgrel=1
arch=(any)

pkgdesc='Printer setup for EPFL'
url='https://www.epfl.ch/campus/services/en/it-services/myprint/'
license=(custom)

makedepends=(coreutils)

_ppd_colour='PPD-C5560i-color.ppd'
_ppd_bw='PPD-6555i-bw.ppd'

source=("https://migration-wp.epfl.ch/myprint/wp-content/uploads/2018/07/$_ppd_colour"
        "https://migration-wp.epfl.ch/myprint/wp-content/uploads/2018/07/$_ppd_bw"
        'COPYRIGHT.C5560i'
        'COPYRIGHT.6555i')
sha256sums=(fad83023f361bdf9485dfe26ffe921a91ade0dac0e937f5e5ef1c2c643505159
            d1ce58bd74c5878ddf49dc4f629d9b7c80b368e29d43e6a28dd6c4a298a11697
            1e9f4b26375de3df78bc55883987dcd416ed34d46d286e2ec16d8ad67ddc61bb
            150a844b74ed93b3f63233c2c9a1619f0c85d7930c49a8be22a867cc435d9a82)

install=epfl-printers.install

package() {
  depends=(cups)

  # PPD files:
  install -Dm644 "$_ppd_colour" "$pkgdir"/usr/share/cups/model/"$_ppd_colour"
  install -Dm644 "$_ppd_bw" "$pkgdir"/usr/share/cups/model/"$_ppd_bw"

  # license:
  install -Dm644 COPYRIGHT.C5560i "$pkgdir"/usr/share/license/"$pkgname"/COPYRIGHT.C5560i
  install -Dm644 COPYRIGHT.6555i "$pkgdir"/usr/share/license/"$pkgname"/COPYRIGHT.6555i
}
