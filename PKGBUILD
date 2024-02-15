# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=tunslip6-ng
pkgver=4.9
_branch=release/v${pkgver}
pkgrel=4
pkgdesc="Tool to establish an IPv6 SLIP tunnel interface"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.contiki-ng.org/"
license=('BSD-3-Clause')
depends=('glibc')
optdepends=()
conflicts=('tunslip')
source=(https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/tools/serial-io/tunslip6.c
        https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/tools/serial-io/serialdump.c
        https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/tools/serial-io/tools-utils.c
        https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/tools/serial-io/tools-utils.h
        https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/LICENSE.md
        https://raw.githubusercontent.com/contiki-ng/contiki-ng/${_branch}/tools/serial-io/Makefile)

sha256sums=('64107f35495496e8a68c4ac5fffdbe71d5095b3435eb1f4360ae57b21431da00'
            '91dbbd45ed07fd4d76209016ced74a88ce9026766dca83d7daf681bb8bdbacf8'
            'a53336f55b87382c3f13011b7c908fa1839316ecc2f4a595f7f7275c6fac82ae'
            'b9e979dc1da9f485e731c0052f4c391d1d0c2f7d6ad13b97c8d8f75ad9b01dfd'
            'cbdd874f179d9cb90784c20c81e91d1a6ad92facce008ff2306545deefb11255'
            'f172c47e71db6717c48d8e97c39ba23c789aa076d602db9fea60562cd9c4c683')

build() {
  make
}

package() {
  install -D -m755 tunslip6 "${pkgdir}/usr/bin/tunslip6"
  install -D -m755 serialdump "${pkgdir}/usr/bin/serialdump"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
