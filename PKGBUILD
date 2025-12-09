# Maintainer: Auto Generated <auto@generated>
pkgname=audacity4-alpha
pkgver=4.0.0_alpha2
pkgrel=1
pkgdesc="Audacity 4.0.0 Alpha 2 (AppImage)"
arch=('x86_64')
url="https://github.com/audacity/audacity"
license=('GPL-3.0-or-later')
options=('!strip')
_appimage="Audacity-4.0.0.253031629.f3e3e3b.-$CARCH.AppImage"
source=("${_appimage}::https://github.com/audacity/audacity/releases/download/Audacity-4.0.0-alpha-2/Audacity-4.0.0.253031629.f3e3e3b.-$CARCH.AppImage"
        "${pkgname}.desktop")
sha256sums=('1cc4f4d4e3924977bad3d03a4a560105d83af73cae72234b97d9b34c5441c801'
            'SKIP')

package() {
    # Install AppImage
    install -Dm755 "$srcdir/${_appimage}" "$pkgdir/opt/$pkgname/audacity.AppImage"
    
    # Create /usr/bin symlink
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/audacity.AppImage" "$pkgdir/usr/bin/$pkgname"
    
    # Install desktop file
    install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}