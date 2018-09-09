# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=pixbuf-webp-thumbnailer
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="WebP image thumbnailer for gdk-pixbuf2"
arch=('x86_64')
license=('custom:CC0')
depends=('gdk-pixbuf2' 'webp-pixbuf-loader')

package() {
    mkdir -p "${pkgdir}/usr/share/thumbnailers"
    cat > "${pkgdir}/usr/share/thumbnailers/gdk-pixbuf-webp-thumbnailer.thumbnailer" <<EOF
[Thumbnailer Entry]
TryExec=/usr/bin/gdk-pixbuf-thumbnailer
Exec=/usr/bin/gdk-pixbuf-thumbnailer -s %s %u %o
MimeType=image/webp;
EOF
}
