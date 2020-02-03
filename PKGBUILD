# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=('gtk3')
makedepends=()
provides=("$pkgname" 'veloren')
conflicts=("$pkgname" 'veloren')
source=(
    "$pkgname"::"https://veloren.sfo2.cdn.digitaloceanspaces.com/releases/0.5.0-linux.tar.gz"
    "veloren-voxygen.desktop"
    "voxygen.png"
)
noextract=("veloren-voxygen.desktop" "voxygen.png")
sha512sums=('edae2207023e373cf85306e433c24b62c44346e76f7cecea4a9a8f6fd914fb841169e78b3e444dd61c1ea42067791aafb10145edae742f2a6236181f0c4edc6c'
            '312439719c23326eee6c04b216c2a16219c3804bdb451b763eb726062a40f364e32f9c9a608086bb92dcb9b24d938a37f1f05229faf20602a9e1756219fcaad3'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

package() {
    install -D "$srcdir/veloren-voxygen" -t "$pkgdir/usr/bin/"
    install -D "$srcdir/veloren-server-cli" -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/assets" "$pkgdir/usr/share/veloren/"
    install -D "$srcdir/veloren-voxygen.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/voxygen.png" -t "$pkgdir/usr/share/pixmaps/"
}
