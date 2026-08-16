# Maintainer: Tsaitang  <Tsaitang404 at gmail dot com>
pkgname="trilium-next-server-bin"
pkgver=0.104.1
pkgrel=1
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
    '9f21966fea2c209ed575090879eede7388f783c0bf7417dfe70021d4c58b48f7'
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
