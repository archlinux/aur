# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.11
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('libcurl-gnutls')
options=('!strip' '!emptydirs')
source=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums=('1ba99a39b3b8a5afe57ed5f965df1fd0e03ef4ee20f181c64f3c8163e24220448988b076135459197bd9d670241ebce6e55dcd5d959b17285553c8216979203e')

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
