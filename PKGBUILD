# Maintainer: Songtronix <contact@songtronix.com>
pkgname=airshipper
pkgver=0.2.1
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
sha512sums=('31bb24f25b08896bb6ed1c2bce772b6a4e308aa52f42b08268ad4a10345281f0048de1b9eec6dd8c9ca5fdaf190e41e3b2f55d7ef39022969ec7a39bf0be71e7'
            '933512b8d5cb2245bfadd195aa75ace92966e91ef15dbbae97516ec76849e8c2b01236f8979f0164a3725a86c30c4ea2cbf17b06df91789ec1aa26445dedbfcb'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
package() {
    install -D "$srcdir/airshipper" -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/airshipper/assets"
    cp -r "$srcdir/assets" "$pkgdir/usr/share/airshipper/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}