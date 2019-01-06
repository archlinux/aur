# Maintainer: Marcel Pfeiffer <pfeiffer.marcel (a) gmx.de>
# Contributor: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=ryver-desktop
pkgver=1.3.2
pkgrel=1
pkgdesc="Ryver client for Linux - Team communications"
arch=('x86_64')
url="https://ryver.com/"
license=('custom')
depends=('alsa-lib' 'expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'libcurl-compat' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://d3vkb1nw20iqfq.cloudfront.net/linux/Ryver-1.3.2-linux-x64.tar.gz" "ryver.png" "ryver.desktop")
sha256sums=('61533a045322936111cf4431499a9c94e2a915d0cf800a87cd7b66f6ef89f166'
            '7aa50868245f75a489eff1c438aec17f51251a07401ef4aee7e7b395e2325377'
            '2ce4f9e27f123a327ed7be69b967e70cec1c4e0752caa39278853d6964f558ad')

package() {
    cd $srcdir/Ryver
    install -dm 755 $pkgdir/opt/$pkgname
    cp -dr --no-preserve=ownership * $pkgdir/opt/$pkgname/

    # Permission fix
    chmod 755 $pkgdir/opt/$pkgname/Ryver

    # app file desktop
    install -dm 755 $pkgdir/usr/share/applications
    install -Dm 644 $srcdir/ryver.png $pkgdir/opt/ryver-desktop/resources/ryver.png
    install -Dm 644 $srcdir/ryver.desktop $pkgdir/usr/share/applications/
}
