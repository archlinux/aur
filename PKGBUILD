# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren
pkgver=0.2.0
pkgrel=1
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
    "$pkgname"::"https://gitlab.com/veloren/veloren/-/jobs/220570217/artifacts/raw/commit-linux-debug.tar.bz2"
    "voxygen.desktop"
    "voxygen.png"
    "veloren-voxygen-run"
)
noextract=("voxygen.desktop" "voxygen.png" "veloren-voxygen-run")
sha512sums=('7c7f5030de97a73d6510d7ed405ac293d027d5cabc70b7a0954734ad764ab2b63b023ead9d27fd3f3e2fdcbb82f3e097d7381324083ae3d2bf6ec9b71f1cde14'
            '52d02514e43022cf9f58981390d8793281145fc262bf0b3145edeead5fa55b98ceba60cbcfe3bbb5e4eb3aede9ddb5b6e39635f1bfa212dd84997e3266c636bc'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94'
            '93ca6ee4b6b6e4f6760fc6529e78d98fe5c2b409c69f49fe1b242dcfb53e16e411e94815b89d7c9d764fc5d2e3e5d31a7fdb573febfb0c871e0ce44074184ac3')

package() {
    mkdir -p "$pkgdir/usr/share/veloren"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/commit-build/assets" "$pkgdir/usr/share/veloren/"
    cp -r "$srcdir/commit-build/shaders" "$pkgdir/usr/share/veloren/"
    cp "$srcdir/commit-build/veloren-voxygen" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"
    cp "$srcdir/commit-build/veloren-server-cli" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-server-cli"
    cp "$srcdir/veloren-voxygen-run" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen-run"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications/veloren"
    cp "$srcdir/voxygen.desktop" "$pkgdir/usr/share/applications/veloren/"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}
