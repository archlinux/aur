# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-bin
pkgver=0.7.0
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
    "$pkgname"::"https://veloren-4129.fra1.digitaloceanspaces.com/releases/$pkgver-linux.tar.gz"
    "veloren-voxygen.desktop"
    "voxygen.png"
)
noextract=("veloren-voxygen.desktop" "voxygen.png")
sha512sums=('bae79124ca6288676d8230de9f5dc3ab6378d034b5df3c7119c25ad505a44ada821e3ed53869842a28d64ccdd998914a4b7c5df4ae6f00676f12d09d568e40da'
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
