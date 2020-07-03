#!/bin/sh
pkgname="atomicpi-utils"
depends=(libgpiod)
pkgdesc="Tools and Utilities for the Atomic Pi Single-board computer from Digital Loggers"
arch=('any')
license=("GPL")
url="https://www.digital-loggers.com/downloads/index.html#API_IMAGES"
pkgver=0.2
pkgrel=1

source=('git+https://github.com/slact/atomicpi-utils.git')
md5sums=('SKIP')

package() {
  cd "${srcdir}/atomicpi-utils"
  install -D -m755 atomicpi-hold-mic "${pkgdir}/usr/bin/atomicpi-hold-mic"
  install -D -m755 atomicpi-hold-xmos "${pkgdir}/usr/bin/atomicpi-hold-xmos"
  install -D -m755 atomicpi-reset-xmos "${pkgdir}/usr/bin/atomicpi-reset-xmos"
  install -D -m755 mmc-status "${pkgdir}/usr/bin/mmc-status"
  install -D -m644 lib_atomicpi.sh "${pkgdir}/usr/lib/atomicpi.sh"
  install -D -m644 lib_gpio-present.sh "${pkgdir}/usr/lib/gpio-present.sh"
  install -D -m644 lib_i2c-gpio-custom-filter.sh "${pkgdir}/usr/lib/lib_i2c-gpio-custom-filter.sh"
  install -D -m644 atomicpi-hold-mic.service "${pkgdir}/etc/systemd/system/atomicpi-hold-mic.service"
  install -D -m644 atomicpi-hold-xmos.service "${pkgdir}/etc/systemd/system/atomicpi-hold-xmos.service"
}
