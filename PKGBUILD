# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn-bin"
pkgver=0.64.2_20261117
pkgrel=2
pkgdesc="Trilium Notes Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
depends=('desktop-file-utils')
source=("$pkgname-$pkgver.tar.xz::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-linux-x64-0.64.2-cn.tar.xz")
sha256sums=('ea22504201f65282dca607b2da1444c3928e92637f6f5aee42227ae1485be9e7')
install="trilium-cn.install"

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
