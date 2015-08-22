# Maintainer: raininja <raijin@rai.ninja>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>

pkgname=slimjet
pkgver=4.0.15.0
pkgrel=2
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:slimjet')
depends=('alsa-lib' 'desktop-file-utils' 'flac' 'gconf' 'gtk2' 'harfbuzz' 'harfbuzz-icu' 'hicolor-icon-theme'
         'icu' 'libpng' 'libxss' 'libxtst' 'nss' 'opus' 'snappy' 'speech-dispatcher' 'ttf-font' 'xdg-utils')
optdepends=('kdebase-kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
makedepends=('pacman>=4.2.0')
provides=('slimjet' 'pepper-flash')
options=('!emptydirs' '!strip')
source_i686=("${pkgname}_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}_amd64.deb::http://www.slimjet.com/{$_channel}/${pkgname}_amd64.deb")
sha512sums_i686=('b0d7e80ed9340f48bfe71af834602c4aa508386d76fda74d32c824e8e24b8ac0cc1b48e65a4831dce9e8af1dc7dd0879f9d7fa8b8d6786bed447ba3abdc72b4f')
sha512sums_x86_64=('72d2029c805a8b91c9a7e386291235fb410181eefd14b22176822dc4d7584b7a3f95b743c43669399ce552d0ea73e901c16b045ca7d7c33aa308338d31fc87a9')

package() {
  msg2 "Extracting the data.tar.lzma..."
  bsdtar -xf data.tar.lzma -C "$pkgdir/"
  msg2 "Changing permissions. . ."
  chmod -R 0755 "$pkgdir/"
  
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
    install -Dm644 "$pkgdir"/opt/slimjet/product_logo_${i/x*}.png \
                   "$pkgdir"/usr/share/icons/hicolor/$i/apps/flashpeak-slimjet.png

    done
    
}
