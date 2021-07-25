# Maintainer: Aerian
pkgname=desktop-naotu-bin
_name=DesktopNaoTu
pkgver=3.2.3
pkgrel=4
pkgdesc="桌面版脑图 (百度脑图离线版，思维导图) 跨平台支持 Windows/Linux/Mac OS. (A cross-platform multilingual Mind Map Tool)"
arch=('x86_64')
url="https://github.com/NaoTu/DesktopNaotu"
license=('GPL2')
conflicts=('naotu' 'desktop-naotu')
source=(
	"$_name-$pkgver.zip::https://github.com/NaoTu/DesktopNaotu/releases/download/v${pkgver}/DesktopNaotu-linux-x64.zip"
    "desktop-naotu.sh"
	"desktop-naotu.desktop"
    favicon.png
)
md5sums=('cfdc8b6ab74266ebff808abd92ae10e5'
         'f6044c2bbaadf9179b49e77a27407931'
         'c1968bffd05a9cd36ad913752db5cfd7'
         '79a0a55a2bf43c6cdea94fe4e990a6ba')

package() {
    msg2 "Start Copying"
    install -d "$pkgdir/opt/DesktopNaoTu"
    cp -a ${srcdir}/DesktopNaotu-linux-x64 ${pkgdir}/opt/DesktopNaoTu
    msg2 "Copying Over"
	install -Dm644 "$srcdir/favicon.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/desktop-naotu.png"
	install -Dm755 "$srcdir/desktop-naotu.sh" "$pkgdir/usr/bin/desktop-naotu"
	install -Dm644 "$srcdir/desktop-naotu.desktop" "$pkgdir/usr/share/applications/desktop-naotu.desktop"
}
