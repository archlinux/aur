# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=mbed-os6
_pkgver=6.1.0
pkgver=${_pkgver//-}
pkgrel=1
pkgdesc='Source code for Arm Mbed OS v6'
arch=('any')
url="https://os.mbed.com"
license=('Apache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ARMmbed/mbed-os/archive/mbed-os-${_pkgver}.tar.gz"
        'mbed-os6.install')
sha256sums=('6c734e3f2b72563e0477a1c1522e4c65c4b9f136eca7c0a77b19163058ae564d'
            '6b0b9674caa5bd90c84793d09b111ff0791b7ee4b9d94e28908009663334000c')
provides=('mbed-os')
install='mbed-os6.install'
options=('!strip' 'libtool' 'staticlibs')

package() {
  cd "mbed-os-mbed-os-${_pkgver}"
  install -dm 0755 ${pkgdir}/usr/src/mbed-os6/
  for l in LICENSE-apache-2.0.txt LICENSE.md
  do
    install -Dm644 "$l" "${pkgdir}/usr/share/licenses/${pkgname}/${l}"
    rm $l
  done
  cp --preserve=mode --recursive . ${pkgdir}/usr/src/mbed-os6/
}

# vim:set ts=2 sw=2 et:
