# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn"
pkgver=0.57.5_20221216
pkgrel=2
pkgdesc="Trilium Notes 服务端 中文版"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64-server.zip")
sha256sums=('ae2f721d310f8acd158e5883e9c99c1fdbf56834540fec466ed75db0480ed53e')

package()
{
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64-server/* "$pkgdir/opt/$pkgname"
    # Create command and make it executable
    install -vDm755 "${srcdir}/trilium-server.sh" "${pkgdir}/usr/bin/trilium-server"
    install -vDm644 "${srcdir}/trilium-server.service" -t "${pkgdir}/usr/lib/systemd/system"
}
