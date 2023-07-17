# Maintainer: jdev082 <jdev0894@gmail.com>
pkgname=firefox-34-bin
pkgver=34.0
pkgrel=2
pkgdesc="Firefox 34.0 for WebIDE and other legacy features."
arch=('any')
url="https://ftp.mozilla.org/pub/firefox/releases/34.0/linux-x86_64/en-US/"
license=('MPL' 'GPL' 'LGPL')
depends=('dbus-glib' 'gtk2' 'libxt' 'nss' 'ccache' 'gnome-themes-standard')
optdepends=('ffmpeg: H264/AAC/MP3 decoding'
            'hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libnotify: Notification integration'
            'networkmanager: Location detection via available WiFi networks'
            'pulseaudio: Sound'
            'upower: Battery API')
            provides=("firefox-34")
source=(https://ftp.mozilla.org/pub/firefox/releases/34.0/linux-x86_64/en-US/firefox-34.0.tar.bz2)
sha256sums=("afe20592beef371ef6e536010c95e3cc9e4c82927a53d58436f5c8348e4ad3dd")

package() {
  mkdir -p $pkgdir/opt/firefox-34
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/applications
  cp -r $srcdir/firefox/* $pkgdir/opt/firefox-34/
  ln -s /opt/firefox-34/firefox "${pkgdir}/usr/bin/firefox34"
  cp -r "../firefox34.desktop" "$pkgdir/usr/share/applications"
}