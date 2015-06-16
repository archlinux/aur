# Maintainer: Florian Schweikert <kelvan@ist-total.org>
pkgname=tunslip
pkgver=2.7
pkgrel=1
pkgdesc="tunslip and tunslip6 are tools to establish an IPv6 SLIP tunnel interface"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.contiki-os.org/"
license=('BSD')
depends=('glibc')
optdepends=()
source=('https://github.com/contiki-os/contiki/raw/${pkgver}/tools/tunslip.c'
        'https://github.com/contiki-os/contiki/raw/${pkgver}/tools/tunslip6.c'
        'https://github.com/contiki-os/contiki/raw/${pkgver}/LICENSE')
md5sums=('ae0988ebf7f0dbf2cbb57f705d1ab5f1'
         'ca464a17fc509a72cc27edd74c194185'
         'b2276b027815460f098d51494e2ff4f1')

build() {
  gcc tunslip.c -o tunslip
  gcc tunslip6.c -o tunslip6
}

package() {
  install -D -m755 tunslip "$pkgdir/usr/sbin/tunslip"
  install -D -m755 tunslip6 "$pkgdir/usr/sbin/tunslip6"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
