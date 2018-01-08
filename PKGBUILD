# Maintainer uzerus <szymonscholz at gmail dot com>
# Previous Maintainer: Matthew Gamble 

pkgname=duck
pkgver=6.3.2.27291
pkgrel=1
pkgdesc="Cyberduck CLI"
arch=('x86_64' 'i686')
license=('GPL')
options=(!strip)
url="https://duck.sh/"
depends=('java-runtime' 'libxtst' 'java-environment-common' 'libglvnd')
optdepends=('gtk2: Graphical interface'
'alsa-lib: Audio support')
source_x86_64=("https://repo.cyberduck.io/stable/x86_64/duck-6.3.2.27291.x86_64.rpm")
source_i686=("https://repo.cyberduck.io/stable/i386/duck-6.3.2.27291.i686.rpm")

package() {
     cp -R opt "${pkgdir}/opt"
     chmod -R go-w "${pkgdir}/opt/duck"
     mkdir -p "${pkgdir}/usr/bin"
     ln -s /opt/duck/duck "${pkgdir}/usr/bin/duck"
    install -Dm644 "${pkgdir}/opt/duck/duck.desktop" "${pkgdir}/usr/share/applications/duck.desktop"
}
md5sums_x86_64=('8266c7932501be5a755163d4b00488f3')
md5sums_i686=('91f4f24b69e26a1e1388d7737a103331')
