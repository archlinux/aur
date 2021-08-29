# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.0.7481
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('94b5c8e383e801d38a5519e58fc98fdfbcdf899fa642eb0595c517bd3e1af969')

prepare() {
  cd $srcdir
  tar xJf data.tar.xz
}

package() {
    cd $srcdir
    install -d ${pkgdir}/opt
    install -d -m755 ${pkgdir}/usr/bin
    cp -R ${srcdir}/opt/${pkgname} ${pkgdir}/opt/
    ln -s ${pkgdir}/opt/uam/uam ${pkgdir}/usr/bin/uam
}
