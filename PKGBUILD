# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn-bin"
pkgver=0.64.0_20261030
pkgrel=1
pkgdesc="Trilium Notes Server Chinese version"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.xz::https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-linux-x64-server-0.64.0-cn.tar.xz")
sha256sums=('dfc34c27459fe59910bb1ce9f8a1da08ce75c2e955efe47b583d1b328ad62ab3')

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
