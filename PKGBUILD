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
source=(git+https://gitlab.com/CANOXNET/spdynu)
install=
md5sums=('SKIP')

build()
{
cd "${srcdir}/spdynu"
gcc spdynUpdater.c -o spdynu
}

package() {
  cp "${srcdir}/spdynu" "${pkgdir}/usr/spdynu"
  chmod u+x "${pkgdir}/usr/spdynu"
  cp "${srcdir}/spdynu.conf" "${pkgdir}/etc/spdynu.conf"
  cp "${srcdir}/spdynu.service" "${pkgdir}/etc/systemd/system/spdynu.service"
  cp "${srcdir}/spdynu.timer" "${pkgdir}/etc/systemd/system/spdynu.timer"
}
