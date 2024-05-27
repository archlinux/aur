# Maintainer: d6k283tix <d6k283tix@mozmail.com>

pkgname=navicat17-premium-cs
pkgver=17.0.3
pkgrel=1
pkgdesc="Navicat Premium is a multi-connection database development tool. (Chinese Simplified)"
arch=(x86_64)
url='https://www.navicat.com.cn/navicat-17-highlights'
license=('NOASSERTION')
source_x86_64=("navicat17-premium-cs-$CARCH-$pkgver.AppImage::https://www.navicat.com.cn/download/direct-download?product=navicat17-premium-cs-x86_64.AppImage&location=1")
sha256sums_x86_64=('20e28d56c6b04fdaa9ff4d857184203846dcb8e9258c7a8ebb067aa16cdd8865')

package() {
    cd $srcdir
    chmod +x $srcdir/navicat17-premium-cs-$CARCH-$pkgver.AppImage
    ./navicat17-premium-cs-$CARCH-$pkgver.AppImage --appimage-extract
    install -d $pkgdir/opt/$pkgname
    cp -a $srcdir/squashfs-root/. $pkgdir/opt/$pkgname/
    install -Dm644 $srcdir/squashfs-root/usr/share/applications/navicat.desktop $pkgdir/usr/share/applications/navicat.desktop
    install -Dm644 $srcdir/squashfs-root/usr/share/icons/hicolor/256x256/apps/navicat-icon.png $pkgdir/usr/share/icons/hicolor/256x256/apps/navicat-icon.png
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$pkgname/AppRun ${pkgdir}/usr/bin/navicat
}
