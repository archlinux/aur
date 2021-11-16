# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.1.193
pkgrel=2
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('6369726427bbbfffe2bf1cbcb333bf1c9ec2d1da68f4ca196c2beddc16a84ec5')

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
