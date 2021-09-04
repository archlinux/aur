# Contributor: Plague-doctor <plague at privacyrequired dot com >

pkgname=mullvad-tray
pkgver=0.3
pkgrel=1
pkgdesc="Mullvad VPN connection status in system tray."
arch=('any')
depends=('python' 'python-pyqt5')
url="https://gitlab.com/Plague_Doctor/mullvad-tray"
license=('GPL3')
source=("https://gitlab.com/Plague_Doctor/mullvad-tray/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('71a8620f85341ab737b29748f22a0c95')

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir/"{usr/bin,usr/share/pixmaps,usr/share/applications,opt/$pkgname/images}
    cp -R "$srcdir/$pkgname-$pkgver/images" $pkgdir/opt/$pkgname
    cp  "$pkgname.py" "$pkgname.ui" $pkgdir/opt/$pkgname/
    ln -s /opt/$pkgname/$pkgname.py $pkgdir/usr/bin/$pkgname

    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-$pkgver/images/$pkgname-logo.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
