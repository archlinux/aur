# Maintainer: Daniel Milde <daniel@milde.cz>
# Co-Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=jaxx
pkgver=2.5.0
pkgrel=1
pkgdesc="Cross-platform Blockchain Wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('custom')
options=(!strip)
optdepends=("fuse2: Running AppImages properly")
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha512sums=('7606ee25875b10b12dff3c781e8167263ce0d6e2e3be7bd8460e6df394e4aa2447e1ba7aec1d908ccecd6a5dd8bf6c0a23b1b50ded4cde1533fc700cbf06e9c5'
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
