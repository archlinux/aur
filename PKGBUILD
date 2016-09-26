# $Id: PKGBUILD 271837 2016-07-13 18:04:54Z arojas $
# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=flashplugin-beta
_licensefile='PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf'
pkgver=23.0.0.181
pkgrel=2
pkgdesc='Adobe Flash Player Beta'
url='http://labs.adobe.com/downloads/flashplayer.html'
arch=('i686' 'x86_64')
depends=('mozilla-common' 'libxt' 'libxpm' 'gtk2' 'nss' 'curl' 'hicolor-icon-theme')
optdepends=('libvdpau: GPU acceleration on Nvidia card')
conflicts=('flashplugin')
provides=('flashplayer' 'flashplugin')
license=('custom')
options=(!strip)
install=flashplugin.install
backup=(etc/adobe/mms.cfg)
source=(http://www.adobe.com/products/eulas/pdfs/${_licensefile}
        mms.cfg)
source_i686=("libflashplayer_${pkgver}_i686.so"::https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux32/libflashplayer.so)
source_x86_64=("libflashplayer_${pkgver}_x86_64.so"::https://fpdownload.macromedia.com/pub/labs/flashruntimes/flashplayer/linux64/libflashplayer.so)
md5sums=('620a140c7e85af655f39f1b583fbf932'
         'f34aae6279b40e0bd2abfb0d9963d7b8')
md5sums_i686=('6a6a838d9f10b5a95041a6cc30e02f1b')
md5sums_x86_64=('5ff31ec89e020056cbfaebd3d93cc767')

package () {
    install -Dm755 "libflashplayer_${pkgver}_${CARCH}.so" "$pkgdir/usr/lib/mozilla/plugins/libflashplayer.so"
    install -Dm644 "${_licensefile}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
    install -Dm644 mms.cfg "$pkgdir/etc/adobe/mms.cfg"
}
