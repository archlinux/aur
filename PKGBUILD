# Maintainer : Colin Berry <colinb969 at gmail dot com>
pkgname=flashpoint-bin
pkgver=6.3
pkgrel=2.1
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition."
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3')
optdepends=('wine: non-native game support')
source=('https://bluepload.unstable.life/selif/flashpoint-linux-x64-20191112.tar.gz')
md5sums=('313d585f60cb4d7a0c834e0ff693729c')

package(){
    # Extract package data
    tar xf flashpoint-linux-x64-20191112.tar.gz -C "${pkgdir}"

    # Symlink exec
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/flashpoint/FlashpointLauncher" "${pkgdir}/usr/bin/flashpoint"

    # Install License
    install -Dm644 "${pkgdir}/opt/flashpoint/licenses/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}