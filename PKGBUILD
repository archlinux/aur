# Maintainer : Colin Berry <colinb969@gmail.com>
pkgname=flashpoint-bin
pkgver=6.3
pkgrel=1.0
pkgdesc="Launcher for BlueMaxima's Flashpoint - Does not include data files! - Launcher software only."
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
license=('MIT')
depends=('nss>=3.0'
         'gtk3')
makedepends=('npm')
source=('https://bluepload.unstable.life/selif/flashpoint-linux-x64-20191112.tar.gz')
md5sums=('313d585f60cb4d7a0c834e0ff693729c')

package(){
    # Extract package data
    tar xf flashpoint-linux-x64-20191112.tar.gz -C "${pkgdir}"

    # Symlink exec
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/flashpoint/FlashpointLauncher" "${pkgdir}/usr/bin/flashpoint"

    # License
    install -Dm644 $pkgdir/opt/flashpoint/licenses/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}