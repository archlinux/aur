# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-next-server-bin"
pkgver=0.92.7
pkgrel=1
pkgdesc="Trilium Notes Server Next version"
arch=('x86_64')
url="https://github.com/TriliumNext/Notes"
license=('AGPL3')
depends=('libxss' 'nss')
conflicts=('trilium-server-bin'
	   'trilium-server-cn'
   	   'trilium-server-cn-bin')
source=("$pkgname.tar.xz::https://github.com/TriliumNext/Notes/releases/download/v$pkgver/TriliumNextNotes-Server-v$pkgver-linux-x64.tar.xz" "trilium-next-server.sh" "trilium-next-server.service")
sha256sums=('SKIP'
	    'SKIP'
    	    'SKIP')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/trilium-next-server"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv TriliumNextNotes-Server-$pkgver-linux-x64/* "$pkgdir/opt/trilium-next-server"
    # Create command and make it executable
    install -vDm755 ../trilium-next-server.sh "${pkgdir}/usr/bin/trilium-next-server"
    install -vDm644 ../trilium-next-server.service -t "${pkgdir}/usr/lib/systemd/system"
}
