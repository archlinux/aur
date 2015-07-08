# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=flashplayer-standalone-debug
pkgver=11.2.202.481
pkgrel=1
pkgdesc="Standalone, debug version of Adobe Flash Player"
arch=(i686 x86_64)
url="http://www.adobe.com/support/flashplayer/downloads.html"
license=custom
depends=(gtk2 libxt nss curl)
[ "$CARCH" = "x86_64" ] && depends=(lib32-gtk2 lib32-libxt lib32-nss lib32-curl)
source=("http://fpdownload.macromedia.com/pub/flashplayer/updaters/11/flashplayer_11_sa_debug.i386.tar.gz"
        "https://www.adobe.com/products/eulas/pdfs/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf")
options=(!strip)
md5sums=('3eacc324c1d6a965f37de5d152382e61'
         '620a140c7e85af655f39f1b583fbf932')

package () {
    install -Dm755 flashplayerdebugger "$pkgdir/usr/bin/flashplayerdebugger"
    install -Dm644 PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf "$pkgdir/usr/share/licenses/$pkgname/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf"
}
