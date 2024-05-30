# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn-bin"
pkgver=0.63.7_20240530
pkgrel=1
pkgdesc="Trilium Notes Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64.zip")
sha256sums=('03180c237fe3b3095e70c67ad8cc56812c80417a3ec4c2fb0667a417643660ec')

package() {
    export destdir="$pkgdir/"
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-cn"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64/* "$pkgdir/opt/trilium-cn"

    echo $PWD
    # Create command
    install -vDm755 ../trilium-cn.sh $pkgdir/usr/bin/trilium-cn
    # Create .desktop file
    install -vDm755 ../trilium-cn.desktop "$pkgdir/usr/share/applications/trilium-cn.desktop"
}
