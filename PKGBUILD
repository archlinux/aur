# Maintainer: Tsaitang  <Tsaitang404 at gmail dot com>
pkgname="trilium-next-server-bin"
pkgver=0.98.0
pkgrel=2
pkgdesc="Trilium Notes Server Next version"
arch=('x86_64')
url="https://github.com/TriliumNext/Trilium"
license=('AGPL3')
depends=('libxss' 'nss')
conflicts=('trilium-server-bin'
	   'trilium-server-cn'
   	   'trilium-server-cn-bin')
source=("$pkgname.tar.xz::https://github.com/TriliumNext/Trilium/releases/download/v$pkgver/TriliumNotes-Server-v$pkgver-linux-x64.tar.xz" "trilium-next-server.sh" "trilium-next-server.service")
sha256sums=('SKIP'
    '9b94039bc5ce162e4195b89fd38e16326ff2c91ac9c79b7dfcb8d2b68fe048bd'
    'SKIP'
    'SKIP')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-next-server"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv TriliumNotes-Server-$pkgver-linux-x64/* "$pkgdir/opt/trilium-next-server"
    # Create command and make it executable
    install -vDm755 ../trilium-next-server.sh "${pkgdir}/usr/bin/trilium-next-server"
    install -vDm644 ../trilium-next-server.service -t "${pkgdir}/usr/lib/systemd/system"
}
