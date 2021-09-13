# Maintainer: Michael Riegert <michael at eowyn net>

pkgname='nrf5-sdk'
_pkgname='nRF5-SDK'
pkgver=17.1.0
_pkgver=17.1.0-ddde560
pkgrel=2
pkgdesc='Software development kit for the nRF52 Series and nRF51 Series SoCs'
arch=('x86_64')
url="https://github.com/nobodywasishere/nrf5-sdk"
license=('custom')
source=("${pkgname}"-"${pkgver}".tar.gz::${url}/archive/v${_pkgver}.tar.gz)
depends=('perl' 'bash' 'python')
sha256sums=('c4bd1b39120bc4b5dd0397a6ea1643d3c7d7ae7f0d2bdeb17f836ebfe0476cce')
install='nrf.install'
package() {
    cd "${srcdir}"/"${_pkgname}"-"${_pkgver}"
    mkdir -p "$pkgdir/opt/nrf5-sdk"
    cp -r ./* "$pkgdir/opt/nrf5-sdk"

    mkdir -p "$pkgdir/usr/share/licenses/nrf5-sdk"
    cp "documentation/licenses.txt" "$pkgdir/usr/share/licenses/nrf5-sdk"
    cp "documentation/nRF5_Nordic_license.txt" "$pkgdir/usr/share/licenses/nrf5-sdk"
    cp "documentation/nRF5_Garmin_Canada_license.txt" "$pkgdir/usr/share/licenses/nrf5-sdk"

}
