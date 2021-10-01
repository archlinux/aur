# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.1.53
pkgrel=3
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('e84a06363ed4a5e71a91218eb6215ed7174da1b8e3839688847cdc82a5bd1e43')

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
