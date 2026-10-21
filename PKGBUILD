# Maintainer: mak <mak@localhost>
pkgname=bloodborne-pc-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Bloodborne native PC port (bbport, SrShadowy build, requires your own game dump)"
arch=('x86_64')
url="https://github.com/SrShadowy/bloodborne_pc"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'systemd-libs' 'vulkan-icd-loader')
provides=('bloodborne-pc')
conflicts=('bloodborne-pc')
options=('!strip')
source=("Bloodborne-bbport-x86_64.AppImage::https://github.com/SrShadowy/bloodborne_pc/releases/download/${pkgver}/Bloodborne-bbport-x86_64.AppImage"
        'LICENSE'
        'bloodborne-pc'
        'bloodborne-pc.desktop'
        'bloodborne-pc.png')
sha256sums=('da4232b6a83d2a3340323fea35448aee542014c9f8f857e68726a6373858a899'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6'
            '05d3255417a62c47655215e333b916a680a80a62c90e75e7a3345b66a270fbfa'
            'dda96dd4187d0443828073f3ab5670c3e5226713c86e00dd59c821f7b72866a6'
            '43acf16390fd766a90d7c19f3c5b80803ae6b354cecc15ff5e60fbb39d6c1abb')

package() {
  install -Dm755 "$srcdir/Bloodborne-bbport-x86_64.AppImage" \
    "$pkgdir/opt/ports/bloodborne-pc/Bloodborne-bbport.AppImage"
  install -Dm755 "$srcdir/bloodborne-pc" "$pkgdir/usr/bin/bloodborne-pc"
  install -Dm644 "$srcdir/bloodborne-pc.desktop" \
    "$pkgdir/usr/share/applications/bloodborne-pc.desktop"
  install -Dm644 "$srcdir/bloodborne-pc.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/bloodborne-pc.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
