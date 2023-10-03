# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.2.603
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('8e4a1d9d23facbf28a74cba8dbd05aed4d74ab245f97d16e10ed92c546adefdf')

prepare() {
  cd $srcdir
  tar xJf data.tar.xz
}

package() {
  cd $srcdir
  install -d ${pkgdir}/opt
  install -d -m755 ${pkgdir}/usr/bin
  cp -R ${srcdir}/opt/${pkgname} ${pkgdir}/opt/
  ln -s /opt/uam/uam ${pkgdir}/usr/bin/uam
}
