# Maintainer Wings-Fantasy <hxshijie@outlook.com>

pkgname=finalshell
pkgver=4.3.10
pkgrel=1
pkgdesc="FinalShell是一体化的的服务器,网络管理软件,不仅是ssh客户端,还是功能强大的开发,运维工具,充分满足开发,运维需求."
url="https://www.hostbuf.com/"
arch=('x86_64')
license=('custom')
provides=('FinalShell')
source=('http://www.hostbuf.com/downloads/finalshell_linux_x64.deb'
        'FinalShell.desktop')
sha256sums=('7f1b3eb6de2b4e25cfec87ebdb03c0b0c3c1034b732cd1218baa6bfc3153d649'
            '3aa0a806f4fd3cdb5a8065226dc779f1915d5535e8bdec64fb7967698a693ed0')

package() {
    cd "$srcdir"
    install -Dm644 FinalShell.desktop "$pkgdir/usr/share/applications/FinalShell.desktop"
    tar -Jxf data.tar.xz
    cd "usr/lib/finalshell/lib"
    install -Dm644 FinalShell.png     "$pkgdir/usr/share/icons/hicolor/scalable/apps/FinalShell.png"
    rm -rf FinalShell.png finalshell-FinalShell.desktop

    mkdir -p "$pkgdir/usr/lib"
    cd "$srcdir/usr/lib"
    cp -r finalshell                  "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "${pkgdir}/usr/lib/finalshell/bin/FinalShell" "${pkgdir}/usr/bin/FinalShell"
}
