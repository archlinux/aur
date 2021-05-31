# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=jaxx-liberty-appimage
pkgver=2.6.4
pkgrel=1
pkgdesc="Cross-platform Blockchain Wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('custom')
options=(!strip)
depends=(nss gdk-pixbuf2 gtk3 fuse2)
conflicts=(jaxx)
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha512sums=('ecabe0e7fd1a12b06c2d16af141c1c81fad6761f056b734f13a2189bad6c57cda90eb69228f8eddc406d3f610321796c449943d391bef1146434755a35ea9eca'
            '5314ae9a0b8054cb8709254ab2f95efd74bf0c4301e6014f9f4676c42c09617da777143b6027843641c54f71abfe4a7c3f9dcc78e32ff807b2e9e92e85a6a7f8'
            '9d0724bdea05a94646df202039eac0ab0b6bace5641496d2b8047cd9e4ea26aa79a378b66f9c5ed9ed62807a1ddb36ee1f2bb8c4c23cf9489d963d8074a11331')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage"
	install -Dm644 jaxx.png "$pkgdir/opt/$pkgname/jaxx.png"
	install -Dm644 jaxx.desktop "$pkgdir/usr/share/applications/jaxx.desktop"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
 
