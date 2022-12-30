# Maintainer Wings-Fantasy <hxshijie@outlook.com>

pkgname=finalshell
pkgver=3.9.7
pkgrel=1
pkgdesc="FinalShell是一体化的的服务器,网络管理软件,不仅是ssh客户端,还是功能强大的开发,运维工具,充分满足开发,运维需求."
url="https://www.hostbuf.com/"
arch=('x86_64')
license=('custom')
provides=('FinalShell')
source=('FinalShell.zip::http://dl.hostbuf.com/finalshell2/finalshell_linux.zip')
sha256sums=('a30896c13ef729e168893cd57b55f0d055faaab33d8cefb406e295f7c68ca896')

package() {
    cd "$srcdir/FinalShell/lib/app"
    install -Dm644 finalshell.desktop	"$pkgdir/usr/share/applications/finalshell.desktop"
    rm finalshell.desktop

    cd "$srcdir/FinalShell/lib/app/img"
    install -Dm644 finalshell.png	"$pkgdir/usr/share/icons/hicolor/scalable/apps/finalshell.png"
    cd "$srcdir/FinalShell/lib/app"
    rm -rf img

    cd "$srcdir"
    mkdir "$pkgdir/usr/lib"
    cp -r FinalShell "$pkgdir/usr/lib/FinalShell"

    chmod 755 "$pkgdir/usr/lib/FinalShell/bin/FinalShell"
}
