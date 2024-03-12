# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn-bin"
pkgver=0.63.3_20240312
pkgrel=1
pkgdesc="Trilium Notes Server Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64-server.zip")
sha256sums=('b097a6e90ac881f9346dbfee31cc95c76c08c41c8eae8908547a7da2ec25b6b5')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-server-cn"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64-server/* "$pkgdir/opt/trilium-server-cn"
    # Create command and make it executable
    install -vDm755 ../trilium-server-cn.sh "${pkgdir}/usr/bin/trilium-server-cn"
    install -vDm644 ../trilium-server-cn.service -t "${pkgdir}/usr/lib/systemd/system"
}
