# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=tunslip
pkgver=3.0
pkgrel=2
pkgdesc="tunslip and tunslip6 are tools to establish an IPv6 SLIP tunnel interface"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.contiki-os.org/"
license=('BSD')
depends=('glibc')
optdepends=()
source=(https://raw.githubusercontent.com/contiki-os/contiki/${pkgver}/tools/tunslip.c
        https://raw.githubusercontent.com/contiki-os/contiki/${pkgver}/tools/tunslip6.c
        https://raw.githubusercontent.com/contiki-os/contiki/${pkgver}/LICENSE)
sha1sums=('bf11557c1b09b48e4344666af40e926ad42060d5'
          '68055e2db448c52861fdad524114d9b7777d25bf'
          'df1b720ae19914bab200bce652a824b72cadbbb6')

build() {
  gcc tunslip.c -o tunslip
  gcc tunslip6.c -o tunslip6
}

package() {
  install -D -m755 tunslip "$pkgdir/usr/bin/tunslip"
  install -D -m755 tunslip6 "$pkgdir/usr/bin/tunslip6"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
