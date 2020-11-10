# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=mbed-os5
pkgver=5.15.6
pkgrel=1
pkgdesc='Source code for Arm Mbed OS v5'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-os/archive/mbed-os-${pkgver}.tar.gz"
        'mbed-os5.install')
sha256sums=('e0cebcedefd81be7caecd89589fe22a1653cf169199752313b85810c3ea2f8fe'
            '594ff118a4293e07691041bc367ea22c25e821a1b6a91aa0c264f35e9b17e9ed')
provides=('mbed-os')
install='mbed-os5.install'
options=('!strip' 'libtool' 'staticlibs')

package() {
  cd "mbed-os-mbed-os-${pkgver}"
  install -dm 0755 ${pkgdir}/usr/src/mbed-os5/
  for l in LICENSE-apache-2.0.txt LICENSE.md
  do
    install -Dm644 "$l" "${pkgdir}/usr/share/licenses/${pkgname}/${l}"
    rm $l
  done
  cp --preserve=mode --recursive . ${pkgdir}/usr/src/mbed-os5/
}

# vim:set ts=2 sw=2 et:
