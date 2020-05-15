# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=mbed-os5
pkgver=5.15.3
pkgrel=1
pkgdesc='Source code for Arm Mbed OS v5'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-os/archive/mbed-os-${pkgver}.tar.gz"
        'mbed-os5.install')
sha256sums=('d7d3916e2dc106a6edae5cecde3fbf618862412548f0d59afb203c1c19cdebac'
            '7a2c1db6dc9c251ecf687b4ecedb611f8c3732022f195663df57f85a3d769ed8')
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
