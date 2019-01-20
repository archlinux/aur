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
  sudo cp -r spdynu /usr/bin/spdynu
  sudo chmod u+x /usr/spdynu
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.conf
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/aur/spdynu.service
  wget https://gitlab.com/CANOXNET/spdynu/raw/master/spdynu.timer
  sudo cp -r spdynu.conf /etc/spdynu.conf
  sudo cp -r spdynu.service /etc/systemd/system/
  sudo cp -r spdynu.timer /etc/systemd/system/
}
