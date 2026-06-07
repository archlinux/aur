# Maintainer: ramdanolii14<developer@nyanpixel.my.id>

pkgname=rplayer-bin
pkgver=1.0
pkgrel=1
pkgdesc="Pemutar musik audio native untuk Arch Linux dengan visualisasi spektrum dan grafik kurs IDR"
arch=('x86_64')
url="https://github.com/ramdanolii14/Rplayer"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-gobject'
    'gtk4'
    'gstreamer'
    'gst-python'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
    'fuse2'
)
options=('!strip')
source=("IDR-Spectrum-Player-x86_64.AppImage::https://github.com/ramdanolii14/Rplayer/releases/download/v${pkgver}/IDR-Spectrum-Player-x86_64.AppImage")
sha256sums=('c6c631dfdd2593077987c8032fc2bbb2d69f595139e2981bfd8fbad4259ee8e2')

package() {
    install -Dm755 "IDR-Spectrum-Player-x86_64.AppImage" \
        "$pkgdir/usr/lib/$pkgname/rplayer.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/rplayer" << 'WRAPPER'
#!/usr/bin/env bash
exec /usr/lib/rplayer-bin/rplayer.AppImage "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/rplayer"
}
