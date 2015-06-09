# Maintainer: Philippe Cherel <philippe.cherel at mayenne dot org>

pkgname=cec-firmware-upgrade
pkgver=0.4
pkgrel=1
pkgdesc="Pulse-Eight's firmware upgrade program for the Pulse-Eight USB-CEC adapter"
arch=('i686' 'x86_64')
url="https://github.com/Pulse-Eight/libcec"
license=('GPL')
depends=('libusb-compat')
provides=('cec-firmware-upgrade')

[ "$CARCH" = i686   ] && source=(http://packages.pulse-eight.net/ubuntu/pool/stable/dists/trusty/$pkgname"_"$pkgver"_"i386.deb)
[ "$CARCH" = x86_64 ] && source=(http://packages.pulse-eight.net/ubuntu/pool/stable/dists/trusty/$pkgname"_"$pkgver"_"amd64.deb)
[ "$CARCH" = i686   ] && md5sums=('26d4c9a1f87b99dfad92d3b5f4fe751e')
[ "$CARCH" = x86_64 ] && md5sums=('5c7f8d0ba0ceba652faa1024be586527')

package() {
  [ "$CARCH" = i686   ] && ar x "${srcdir}/$pkgname"_"$pkgver"_"i386.deb"
  [ "$CARCH" = x86_64 ] && ar x "${srcdir}/$pkgname"_"$pkgver"_"amd64.deb"

  tar -xpf "${srcdir}/data.tar.xz"
  cp -r "${srcdir}/usr/" "${pkgdir}"
}
