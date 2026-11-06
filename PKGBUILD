# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn-bin"
pkgver=0.64.1_20261106
pkgrel=1
pkgdesc="Trilium Notes Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-linux-x64-0.64.1-cn.tar.xz")
sha256sums=('892cd35eadd98c8ecd243da78f4c2aafcd77392bffb6228f97e70d9385e0adfd')

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
