# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.9
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('libcurl-gnutls')
options=('!strip' '!emptydirs')
source=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums=('c4fe27ca1caf8b766dcd5a8f767286a162c0f84658d8f01c497191d17158cf033882e61dec7d4c2fec317e460ce98ae7762fb832d5df9a13dcd60af2218b13b5')

package(){
    # Extract package data
    tar xf data.tar.xz -C "${srcdir}"
    cd "${srcdir}"
    
    install -Dm0755 usr/bin/helio "$pkgdir"/usr/bin/helio
    install -Dm0755 usr/share/applications/Helio.desktop "$pkgdir"/usr/share/applications/helio.desktop
    for i in 16x16 32x32 48x48 128x128 256x256; do
        install -Dm644 usr/share/icons/hicolor/"$i"/apps/helio-workstation.png \
            "$pkgdir"/usr/share/icons/hicolor/"$i"/apps/helio-workstation.png
    done
}
