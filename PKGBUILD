# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.1.353
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('0b4895b6b1a501fda70689a8a4e9a2b6b42fa9d2fe1ea19670c9d19ad383c00e')

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
