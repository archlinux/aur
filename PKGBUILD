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

package() {
  mkdir -p "${srcdir}/tmp"
  cd "${srcdir}/tmp"
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynUpdater.c
  gcc spdynUpdater.c -o spdynu
  sudo cp -r spdynu /usr/spdynu
  sudo chmod u+x /usr/spdynu
  mkdir -p "${srcdir}/tmp"
  cd "${srcdir}/tmp"
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.conf
  sudo cp -r "${srcdir}/tmp/spdynu.conf" "${pkgdir}/etc/spdynu.conf"
}
