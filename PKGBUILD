# Maintainer: mak <mak@localhost>
pkgname=gow3-pc-bin
pkgver=2.6.0
pkgrel=1
pkgdesc="God of War III Remastered native PC port (SpartanPort, requires your own game dump)"
arch=('x86_64')
url="https://github.com/FelipePrado0/SpartanPort"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'systemd-libs' 'vulkan-icd-loader' 'fuse2')
provides=('gow3-pc')
conflicts=('gow3-pc')
options=('!strip')
source=("spartanport-x86_64.AppImage::https://github.com/FelipePrado0/SpartanPort/releases/download/windows-v${pkgver}/spartanport-x86_64.AppImage"
        'LICENSE'
        'gow3-pc'
        'gow3-pc.desktop'
        'gow3-pc.png')
sha256sums=('0b3a09e301065dc2fe87b2b47166dd6747d51a35295b2baebc2e4e082350cec1'
            'edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6'
            '7fe0c2c08d62206e23a2e100a4494d59f457d02b7b93b3ebe2914f7f43a2d68d'
            '355fba0cdf552e38fe876d2a74eccb3cbc23189fc31ff5910b42415e5e3e3078'
            '6bed8f45886e9c2ee18f8102b23cf72e50cb068c57c52f8c67121a6ef7d55d66')

package() {
  install -Dm755 "$srcdir/spartanport-x86_64.AppImage" \
    "$pkgdir/opt/ports/gow3-pc/spartanport.AppImage"
  install -Dm755 "$srcdir/gow3-pc" "$pkgdir/usr/bin/gow3-pc"
  install -Dm644 "$srcdir/gow3-pc.desktop" \
    "$pkgdir/usr/share/applications/gow3-pc.desktop"
  install -Dm644 "$srcdir/gow3-pc.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gow3-pc.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
