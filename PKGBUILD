# Maintainer: abdalrohman-alnassier <abdd199719@gmail.com>

pkgname=show-motd
pkgver=3.6
pkgrel=0
pkgdesc="show message of the day in interactive shells"
arch=('i686' 'x86_64')
url="https://launchpad.net/update-motd"
license=('GPLv3')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}-${pkgrel}ubuntu7_all.deb")
md5sums=('143b600bd5b1876d6bb3ad4318bfa933')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${srcdir}"
  msg2 "Moving stuff in place..."
  install -D -m755 ${srcdir}/etc/profile.d/update-motd.sh "${pkgdir}/etc/profile.d/update-motd.sh"
  install -D -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  cp -rf ${srcdir}/usr/share/doc/${pkgname}/* "${pkgdir}/usr/share/doc/${pkgname}/"
}


