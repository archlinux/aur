# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn"
pkgver=0.59.1_20230301
pkgrel=1
pkgdesc="Trilium Notes Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64.zip")
sha256sums=('d5837d5efcc7558dcd55d82b47911b826e7a9c1f980f38f143e28dc302f6d3f3')

package() {
    export destdir="$pkgdir/"
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64/* "$pkgdir/opt/$pkgname"

    echo $PWD
    # Create command
    install -vDm755 ../trilium-cn.sh $pkgdir/usr/bin/trilium-cn
    # Create .desktop file
    install -vDm755 ../trilium-cn.desktop "$pkgdir/usr/share/applications/trilium-cn.desktop"
}
