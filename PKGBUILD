#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=mullvad-tray
pkgver=0.3
pkgrel=1
pkgdesc="Mullvad VPN connection status in system tray."
arch=('any')
depends=('python' 'python-pyqt5')
url="https://gitlab.com/Plague_Doctor/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2"
license=('GPL')
source=(
        "mullvad-tray.desktop"
        "$pkgname-$pkgver-$pkgrel.tar.bz2"::"$url"
       )

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/"{usr/bin,usr/share/pixmaps,usr/share/applications,opt/$pkgname/images}
    cp -R "$srcdir/mullvad-tray-$pkgver/images" $pkgdir/opt/$pkgname
    cp  "$srcdir/mullvad-tray-$pkgver/mullvad-tray.py" $pkgdir/opt/$pkgname/
    cp  "$srcdir/mullvad-tray-$pkgver/mullvad-tray.ui" $pkgdir/opt/$pkgname/
    ln -s /opt/$pkgname/$pkgname.py $pkgdir/usr/bin/$pkgname

    install -Dm644 "mullvad-tray.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "$srcdir/mullvad-tray-$pkgver/images/mullvad-tray-logo.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
}

md5sums=('466284059b279f7e570ed13a7c4fd82c'
         '71a8620f85341ab737b29748f22a0c95')
