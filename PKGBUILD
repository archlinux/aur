# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-server-cn"
pkgver=0.58.8_20230215
pkgrel=1
pkgdesc="Trilium Notes 服务端 中文版"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64-server.zip")
sha256sums=('ec9c1fd176340becbb82c23ac132cf59f17ed4b915de475b1efb53919dbba30e')

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
