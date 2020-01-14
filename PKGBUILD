#!/bin/sh
pkgname="atomicpi-utils"
depends=(libgpiod)
pkgdesc="Tools and Utilities for the Atomic Pi Single-board computer from Digital Loggers"
arch=('any')
license=("Unknown")

pkgver=0.1
pkgrel=0

source=(atomicpi-hold-mic
        atomicpi-hold-xmos
        atomicpi-reset-xmos
        lib_atomicpi.sh
        lib_gpio-present.sh
        lib_i2c-gpio-custom-filter.sh
        mmc-status
)
md5sums=('278fb4895488f3c191dbc8c01f316652'
         'a3514ab3b4d3e047e42b2e00ebcc6b4e'
         'b7c2352da6b12aafc45d1c1d4a9ad483'
         '4e3af84055edf48d49372e2fd67ef05c'
         '9ac895e909ebd9fd64293e390f9bd7e3'
         '7660a6981d202526d4b3e733fbb3f954'
         '221c1499797d5b514dc6f25270498446')

package() {
  install -D -m755 atomicpi-hold-mic "${pkgdir}/usr/bin/atomicpi-hold-mic"
  install -D -m755 atomicpi-hold-xmos "${pkgdir}/usr/bin/atomicpi-hold-xmos"
  install -D -m755 mmc-status "${pkgdir}/usr/bin/mmc-status"
  install -D -m644 lib_atomicpi.sh "${pkgdir}/usr/lib/atomicpi.sh"
  install -D -m644 lib_gpio-present.sh "${pkgdir}/usr/lib/gpio-present.sh"
  install -D -m644 lib_i2c-gpio-custom-filter.sh "${pkgdir}/usr/lib/lib_i2c-gpio-custom-filter.sh"
}
