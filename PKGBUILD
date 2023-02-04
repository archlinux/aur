# Maintainer: Luis Aranguren <pizzaman@hotmail.com> 
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=jaxx-liberty-appimage
pkgver=3.0.0
pkgrel=1
pkgdesc="Cross-platform Blockchain Wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('custom')
options=(!strip)
depends=(nss gdk-pixbuf2 gtk3 fuse2)
conflicts=(jaxx)
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha512sums=('a8f88d70d5ebe28907b3f0d8bc67e3495162b004e781a5ceaeb765b442c5f491c92c4a1f27f91af977eef0b3aa3d30fda70688edd728476e15b0238e9ca06b2f'
            '86ae3c693efa0f7f9e5c4ecd04ca973ec2293c1b98396cbd72783ddb90880a56cab4100e8fabeee141f2d65828e4c93adac50c5d08996cf242f0dc45fc2dbd0b'
            '49c93c483b8355709f3f512ced58781e21f55db5a614ed833b98b6ea0a3fb11f6b3c0dab6f9999537e40081ea3dce87ba65812dee00ad3c79b247fe00c1bc370')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage"
	install -Dm644 jaxx.png "$pkgdir/opt/$pkgname/jaxx.png"
	install -Dm644 jaxx.desktop "$pkgdir/usr/share/applications/jaxx.desktop"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
 
