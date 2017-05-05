# Maintainer: boosterdev@linuxmail.org

pkgname=flashplayer-standalone
pkgver=25.0.0.148
pkgrel=1
pkgdesc="Macromedia standalone flash player (nonfree)"
arch=('x86_64')
url='http://www.adobe.com/support/flashplayer/downloads.html'
license=('custom')
depends=('desktop-file-utils' 'gtk2' 'libxt' 'nss')
optdepends=('alsa-lib: for sound through alsa')
options=(!strip)
source=('https://fpdownload.macromedia.com/pub/flashplayer/updaters/25/flash_player_sa_linux.x86_64.tar.gz'
        'license.pdf::http://www.adobe.com/products/eulas/pdfs/PlatformClients_PC_WWEULA-MULTI-20110809_1357.pdf'
        'flashplayer.desktop')
sha256sums=('3fa41909623397d98f6284af5a2a053cb49e3a96c1586dbca4b627376d5fba77'
            'd30b03c0f70f7c4a7837751286bab579d5033f2e7a1548279a9c09ea905b2849'
            '92851d38791e9501b70861c2ff02ee1c5aa7298be5e6801088f01150c9b31acd')

package() {
  install -d -m755 "$pkgdir"/usr/share/applications/
  install -D -m644 "$srcdir"/flashplayer.desktop "$pkgdir"/usr/share/applications/
  install -D -m644 license.pdf "$pkgdir"/usr/share/licenses/$pkgname/license.pdf
  install -D -m755 flashplayer "$pkgdir"/usr/bin/flashplayer
}
