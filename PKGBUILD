# Maintainer: Daniel Milde <daniel@milde.cz>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=jaxx
pkgver=2.6.0
pkgrel=2
pkgdesc="Cross-platform Blockchain Wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('custom')
options=(!strip)
depends=(nss gdk-pixbuf2 gtk3 fuse2)
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha512sums=('16de9034783316f7a7dc416f5a7bccb3282247d0a28091d4f4262e9ef5fc6d848d0d2bf9feb22e2092813d7a572dd718de40ac08ef8810cb29dcb6d032d201e6'
            '5314ae9a0b8054cb8709254ab2f95efd74bf0c4301e6014f9f4676c42c09617da777143b6027843641c54f71abfe4a7c3f9dcc78e32ff807b2e9e92e85a6a7f8'
            'b7852e094922a5d2ed6c8963bc9961c60124e71f6c253d3f8d846de9e5d32e91dfb6bf7709a3af4f2956f5bb791439a144910786e44f160604e9eddec53745c2')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage"
	install -Dm644 jaxx.png "$pkgdir/opt/$pkgname/jaxx.png"
	install -Dm644 jaxx.desktop "$pkgdir/usr/share/applications/jaxx.desktop"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
