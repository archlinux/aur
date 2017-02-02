# Maintainer: XavierCLL <xavier.corredor.llano (a) gmail.com>

pkgname=ryver-desktop
pkgver=1.2.0
pkgrel=1
pkgdesc="Ryver client for Linux - Team communications"
arch=('x86_64')
url="https://ryver.com/"
license=('custom')
depends=('alsa-lib' 'expat' 'gconf' 'gtk2' 'gvfs' 'hunspell' 'hunspell-en' 'libcurl-compat' 'libgcrypt' 'libgnome-keyring' 'libnotify' 'libxss' 'libxtst' 'xdg-utils')
optdepends=('gnome-keyring')
source=("https://ryver.com/download/linux/stable"
        "ryver.desktop")
sha256sums=('d886bb520dc086481828cf2d9f76b048f8b9d5c1e2a852bd808b5750dc15cf24'
            '38feec313670fefe6593f659c2bc36078e66ba18b63cb2e807da46bbe4edd5ba')

package() {
    cd $srcdir/Ryver
    install -dm 755 $pkgdir/opt/$pkgname
    cp -dr --no-preserve=ownership * $pkgdir/opt/$pkgname/
    
    # Permission fix
    chmod 755 $pkgdir/opt/$pkgname/Ryver
    
    # app file desktop
    install -dm 755 $pkgdir/usr/share/applications
    install -Dm 644 $srcdir/ryver.desktop $pkgdir/usr/share/applications/
}
