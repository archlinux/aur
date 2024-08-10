# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-next-server-bin"
pkgver=0.90.4
pkgrel=2
pkgdesc="Trilium Notes Server Next version"
arch=('x86_64')
url="https://github.com/TriliumNext/Notes"
license=('AGPL3')
source=("$pkgname-$pkgver.zip::https://github.com/TriliumNext/Notes/releases/download/v$pkgver/trilium-linux-x64-server-$pkgver.tar.xz" "trilium-next-server.sh" "trilium-next-server.service")
sha256sums=('62bd284e2842010b2485e6746ed09c91d48c24aec89d507598a9fa683ab8b2fb'
	    '9f21966fea2c209ed575090879eede7388f783c0bf7417dfe70021d4c58b48f7'
    	    'f002d981d84b5314755dc059cdef341ed3a492506fb3d7bf789342383c87c358')

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
