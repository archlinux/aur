# Maintainer: Steven Seifried <gitlab@canox.net>
pkgname=spdynu
pkgver=2018.11
pkgrel=0
pkgdesc="An Dynamic DNS Client for spdyn.de"
arch=('any')
url="https://gitlab.com/CANOXNET/spdynu"
license=('GPLv2')
#depends=('')
makedepends=('gcc')
source=(https://gitlab.com/CANOXNET/spdynu)
install=
md5sums=('SKIP')

build()
{
cd "${srcdir}/spdynu"
gcc spdynUpdater.c -o spdynu
}

package() {
  install -Dvm755 "${srcdir}/spdynu" "${pkgdir}/usr/spdynu"
  install -Dvm755 "${srcdir}/spdynu.conf" "${pkgdir}/etc/spdynu.conf"
  install -Dvm755 "${srcdir}/spdynu.service" "${pkgdir}/etc/systemd/system/spdynu.service"
  install -Dvm755 "${srcdir}/spdynu.timer" "${pkgdir}/etc/systemd/system/spdynu.timer"
}
