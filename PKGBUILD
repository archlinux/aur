# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn-bin"
pkgver=0.64.2_20261117
pkgrel=1
pkgdesc="Trilium Notes Server Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-linux-x64-server-0.64.2-cn.tar.xz")
sha256sums=('97b93e6fd13f1b3f0647ccb7d756196f8dcf32946e671a4ce651cfe396c2b67e')

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
