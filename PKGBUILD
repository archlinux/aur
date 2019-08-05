# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren
pkgver=0.3.0
pkgrel=2
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64')
url="https://veloren.net/"
license=('GPL3')
options=()
depends=('bash')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "$pkgname"::"https://gitlab.com/veloren/veloren/-/jobs/265513558/artifacts/raw/optional-release-linux-debug.tar.bz2"
    "voxygen.desktop"
    "voxygen.png"
)
noextract=("voxygen.desktop" "voxygen.png")
sha512sums=('c124e02e11a86209328c171dfbf7e292d62ea75e8d7afd06b18755ffd58807d5cc1dc36654948fc604c64f5ef88db4773dd43d27cb5ea2659fd447ae5475eaed'
            '209a1c66fcdb932df5472084e42213ee4820f07066a189f5ccb0f1a62becff3cdbaf4e00bc15534b287b02bccc1faa792649a1eff8b2d6d218b8b3692ed3a703'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

package() {
    mkdir -p "$pkgdir/usr/share/veloren"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/optional-release-build/assets" "$pkgdir/usr/share/veloren/"
    cp -r "$srcdir/optional-release-build/shaders" "$pkgdir/usr/share/veloren/"
    cp "$srcdir/optional-release-build/veloren-voxygen" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"
    cp "$srcdir/optional-release-build/veloren-server-cli" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-server-cli"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications/veloren"
    cp "$srcdir/voxygen.desktop" "$pkgdir/usr/share/applications/veloren/"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}
