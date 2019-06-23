# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren
pkgver=0.2.0
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
    "$pkgname"::"https://gitlab.com/veloren/veloren/-/jobs/220570217/artifacts/raw/commit-linux-debug.tar.bz2"
    "voxygen.desktop"
    "voxygen.png"
)
noextract=("voxygen.desktop" "voxygen.png")
sha512sums=('7c7f5030de97a73d6510d7ed405ac293d027d5cabc70b7a0954734ad764ab2b63b023ead9d27fd3f3e2fdcbb82f3e097d7381324083ae3d2bf6ec9b71f1cde14'
            '27e4e25dc7f7f149873da28414b176c19c27d4c8d656a7f2ab11648137d75e2ec7d0ed07066e5384525123eace34debe1417d16f3e86a2b4ccf06f7c77fa052e'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

package() {
    mkdir -p "$pkgdir/usr/share/veloren"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/commit-build/assets" "$pkgdir/usr/share/veloren/"
    cp -r "$srcdir/commit-build/shaders" "$pkgdir/usr/share/veloren/"
    cp "$srcdir/commit-build/veloren-voxygen" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"
    cp "$srcdir/commit-build/veloren-server-cli" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-server-cli"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications/veloren"
    cp "$srcdir/voxygen.desktop" "$pkgdir/usr/share/applications/veloren/"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}