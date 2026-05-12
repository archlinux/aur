# Maintainer: phil-gru <goldencat@tutamail.com>                                     
pkgname=pearpass-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="PearPass is a distributed password manager powered by Pear Runtime. It allows secure storage of passwords, credit card details, and secure notes, with peer-to-peer syncing and end-to-end encryption."
arch=('x86_64')
url="https://pass.pears.com/"
license=('custom')
#depends=('webkitgtk-6.0')
options=(!strip !debug)
provides=('pearpass')
_appimage="PearPass-Desktop-Linux-x64-v${pkgver}.AppImage"
source=(
    "PearPass-Desktop-Linux-x64-v${pkgver}.AppImage::https://github.com/tetherto/pearpass-app-desktop/releases/download/v${pkgver}/PearPass-Desktop-Linux-x64-v${pkgver}.AppImage"
    "pearpass.desktop"
    "pearpass.png"
    )
noextract=("${_appimage}")
sha256sums=('db70df54506bd49590c44dd72b2ed50b3eff7812e14cd70f6c23491745cf3af6'
            '6ad6ae0045b0dd8618c4c69ef465c9496599d6439c2a870d3c41c7141e4a4463'
            '5a2b6c3517d3683808178285a4ec647f531f281af96913b8f11e2a9c6f048f14')

package() {
    install -Dm755 $_appimage "$pkgdir"/usr/bin/pearpass
    chmod +x "${pkgdir}/usr/bin/pearpass"

    install -Dm644 "pearpass.desktop"                    "${pkgdir}/usr/share/applications/pearpass.desktop"
    install -Dm644 "pearpass.png"                        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pearpass.png"
}
