# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn"
pkgver=0.62.4_20231207
pkgrel=1
pkgdesc="Trilium Notes Server Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64-server.zip")
sha256sums=('c58d043276a36d92e57c019c7d77924aae84fb123521b18febda97b8b5d177b6')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64-server/* "$pkgdir/opt/$pkgname"
    # Create command and make it executable
    install -vDm755 ../trilium-server-cn.sh "${pkgdir}/usr/bin/trilium-server-cn"
    install -vDm644 ../trilium-server-cn.service -t "${pkgdir}/usr/lib/systemd/system"
}
