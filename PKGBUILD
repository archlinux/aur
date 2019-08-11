# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=()
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "$pkgname"::"https://gitlab.com/veloren/veloren/-/jobs/265513558/artifacts/raw/optional-release-linux-debug.tar.bz2"
    "veloren-voxygen.desktop"
    "voxygen.png"
)
noextract=("veloren-voxygen.desktop" "voxygen.png")
sha512sums=('c124e02e11a86209328c171dfbf7e292d62ea75e8d7afd06b18755ffd58807d5cc1dc36654948fc604c64f5ef88db4773dd43d27cb5ea2659fd447ae5475eaed'
            '312439719c23326eee6c04b216c2a16219c3804bdb451b763eb726062a40f364e32f9c9a608086bb92dcb9b24d938a37f1f05229faf20602a9e1756219fcaad3'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

package() {
    install -D "$srcdir/optional-release-build/veloren-voxygen" -t "$pkgdir/usr/bin/"
    install -D "$srcdir/optional-release-build/veloren-server-cli" -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/optional-release-build/assets" "$pkgdir/usr/share/veloren/"
    install -D "$srcdir/veloren-voxygen.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/voxygen.png" -t "$pkgdir/usr/share/pixmaps/"
}
