# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-next-server-bin"
pkgver=0.90.4
pkgrel=1
pkgdesc="Trilium Notes Server Next version"
arch=('x86_64')
url="https://github.com/TriliumNext/Notes"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64-server.zip")
source=("$pkgname-$pkgver.zip::https://github.com/TriliumNext/Notes/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz")
sha256sums=('SKIP')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-next-server"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64-server/* "$pkgdir/opt/trilium-next-server"
    # Create command and make it executable
    install -vDm755 ../trilium-next-server.sh "${pkgdir}/usr/bin/trilium-next-server"
    install -vDm644 ../trilium-next-server.service -t "${pkgdir}/usr/lib/systemd/system"
}
