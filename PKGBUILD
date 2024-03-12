# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn-bin"
pkgver=0.63.3_20240312
pkgrel=1
pkgdesc="Trilium Notes Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64.zip")
sha256sums=('f561cd0cafecbfd8841ee934e3d5fcb4596cdad4071f756c531bb8f40a4f25f1')

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
