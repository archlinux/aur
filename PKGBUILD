# Maintainer: qtlis <qtlis plus aur at posteo dot de>
# Contributor: Bernhard Landauer <oberon@mnajaro.org>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: korrode <korrode at gmail>
# Contributor: sumt <sumt at sci dot fi>

pkgname=palemoon-uxp-bin
pkgver=28.0.0b3
pkgrel=1
pkgdesc="Open source web browser based on Firefox focusing on efficiency. Unstable UXP preview"
arch=('x86_64')
url="https://linux.palemoon.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('alsa-lib'
    'dbus-glib'
    'desktop-file-utils'
    'gtk2'
    'libxt'
    'mime-types'
    'nss')
optdepends=('ffmpeg: record, convert, and stream audio and video')
provides=("palemoon=$pkgver")
conflicts=('palemoon')
options=('!strip')
source=("https://linux.palemoon.org/datastore/release/palemoon-unstable-latest.linux-x86_64.tar.bz2"
        palemoon.desktop)
sha256sums=('1ed531dc3850cb0550f782d58872cfb3e4565e286f418b2d0ed1d72cd317729a'
            'c6cae1c0de6b59da1d846cb2092ca2725ba2baa4d554223f747a4a71ee63002e')

package() {
  install -d "$pkgdir"/usr/{bin,lib}
  cp -r palemoon/ "$pkgdir/usr/lib/palemoon"
  ln -s ../lib/palemoon/palemoon "$pkgdir/usr/bin/palemoon"
  install -Dm644 palemoon.desktop "$pkgdir/usr/share/applications/palemoon.desktop"

  # icons
  install -Dm644 palemoon/browser/chrome/icons/default/default16.png \
    "$pkgdir/usr/share/icons/hicolor/16x16/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default32.png \
    "$pkgdir/usr/share/icons/hicolor/32x32/apps/palemoon.png"
  install -Dm644 palemoon/browser/chrome/icons/default/default48.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/palemoon.png"
  install -Dm644 palemoon/browser/icons/mozicon128.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/palemoon.png"
}
