# Maintainer: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.3.1
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://www.songtronix.com/'
license=('GPL3')
depends=('openssl' 'libxcb' 'fontconfig')
provides=()
conflicts=("$pkgname-git")
source=(
    "https://www.songtronix.com/download/airshipper-${pkgver}.zip"
    'airshipper.desktop'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('14671985bad2c94fdc067ecc2315f975c33d993a3bf384c19b1534c0d33a8aa4f1164b0ee2214dd280828d501163ed6852e0a4b7972135ddfdbac8ab17a924d7'
            '933512b8d5cb2245bfadd195aa75ace92966e91ef15dbbae97516ec76849e8c2b01236f8979f0164a3725a86c30c4ea2cbf17b06df91789ec1aa26445dedbfcb'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/airshipper/assets"
    cp -r "$srcdir/assets" "$pkgdir/usr/share/airshipper/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}
