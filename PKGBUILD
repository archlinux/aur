# Maintainer: Gyara <laxect39@gmail.com>

pkgname=helio-workstation-bin
pkgver=3.10
pkgrel=1
pkgdesc="Helio is free and cross-platform lightweight music creation playground."
arch=('x86_64')
url="https://helio.fm/"
license=('GPL3')
depends=('libcurl-gnutls')
options=('!strip' '!emptydirs')
source=("https://ci.helio.fm/helio-${pkgver}-x64.deb")
sha512sums=('6d0ed7761feefcb4caff5844d815993526fbf08a40cd45b382b9bd88e656c05d7760373f3be59324817123edecd4b420a66f96d430e950059b89ba8b35b79d10')

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
