# Maintainer: omarplayz <omarplayzsounds@gmail.com>
pkgname=deta-surf
pkgver=1.3.0_beta.0.x86
pkgdesc="Deta Surf, an AI notebook that brings all your files and the web directly into your stream of thought."
pkgrel=1
arch=('x86_64')
url="https://deta.surf"
license=('Apache-2.0')
depends=(glibc)
source=('deta-surf-1.3.0_beta.0.x86.AppImage::https://assets.deta.surf/releases/259957125/linux-x64/download'
        'deta-surf.desktop')
sha256sums=('0afac1174c7ac11dc2939688dbed71379c38b3aa9f4f7a1fdc6ce1344ad53c83'
            'SKIP')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv "$srcdir"/deta-surf-*.AppImage "$pkgdir/usr/bin/deta-surf"
    chmod +x "$pkgdir/usr/bin/deta-surf"

    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/deta-surf.desktop" "$pkgdir/usr/share/applications/deta-surf.desktop"
    chmod 644 "$pkgdir/usr/share/applications/deta-surf.desktop"

    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    curl -L -o "$pkgdir/usr/share/icons/hicolor/128x128/apps/deta-surf.png" \
        https://raw.githubusercontent.com/deta/surf/main/app/src/renderer/assets/icon_512.png
    chmod 644 "$pkgdir/usr/share/icons/hicolor/128x128/apps/deta-surf.png"

    # a small response
    echo "Done!"
}

