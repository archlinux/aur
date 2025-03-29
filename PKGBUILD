# Maintainer: texas0295 <texas0295@outlook.com>

pkgbase=solian
pkgname=solian-bin-git
pkgver=2.4.2+85+gbdfe13de
_buildcommit=dfe13de
pkgrel=1
pkgdesc="Next Generation Network Center (unstable)"
arch=('x86_64')
url="https://solsynth.dev"
license=('unknown')
depends=(
    "libnotify>=0.8.6"
    "gtk3>=3.24.49"
    "mpv>=0.40.0"
    "libkeybinder3>=0.3.2"
    "gstreamer>=1.26.0"
    "libayatana-appindicator>=0.5.93"
    "libayatana-indicator>=0.9.4"
)
options=('!strip')
source=(
    "Solian-x86_64-$_buildcommit.AppImage::https://raw.github.com/Texas0295/Solian-AUR-Host/main/Solian-x86_64-$_buildcommit.AppImage"
    "Solian.desktop"
    "Solian.png"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
conflicts=(
    "solian-bin-git"
    "solian-bin"
)
package(){
    cd "$srcdir"

    # Create dirs
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/opt/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"

    echo "creat dirs - end"

    # Install AppImage
    install -Dm755 "Solian-x86_64-$_buildcommit.AppImage" "$pkgdir/opt/$pkgname/Solian-x86_64-$_buildcommit.AppImage"

    echo "install appimage - end"

    # Install icon
    install -Dm644 "Solian.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/Solian.png"

    echo "install icon - end"

    # Install desktop file
    install -Dm644 "Solian.desktop" "$pkgdir/usr/share/applications/Solian.desktop"

    echo "install desktop file - end"

    # Link executable
    ln -s "/opt/${pkgname}/Solian-x86_64-$_buildcommit.AppImage" "${pkgdir}/usr/bin/solian-bin-git"

    echo "success"
}
