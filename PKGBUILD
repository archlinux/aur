# Maintainer: boosterdev@linuxmail.org

pkgname=flashplayer-standalone
pkgver="28.0.0.126"
pkgrel=1
pkgdesc="Adobe Flash Player (Standalone)"
arch=("$CARCH")
url='http://www.adobe.com/support/flashplayer/downloads.html'
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'libxt' 'nss')
optdepends=('alsa-lib: for sound through alsa')
options=(!strip)
source=("flash-player-standalone-$pkgver.tar.gz::https://fpdownload.macromedia.com/pub/flashplayer/updaters/28/flash_player_sa_linux.x86_64.tar.gz"
        'license.pdf::http://www.adobe.com/products/eulas/pdfs/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf'
        'flashplayer.desktop')
sha256sums=('93557d22ceff2287b01c113b4f08eb995d382b5f992f6403a85ba62b7929b293'
            'd30b03c0f70f7c4a7837751286bab579d5033f2e7a1548279a9c09ea905b2849'
            '92851d38791e9501b70861c2ff02ee1c5aa7298be5e6801088f01150c9b31acd')

package() {
  install -d -m755 "$pkgdir"/usr/share/applications/
  install -D -m644 "$srcdir"/flashplayer.desktop "$pkgdir"/usr/share/applications/
  install -D -m644 license.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
  install -D -m755 flashplayer "$pkgdir"/usr/bin/flashplayer
}
