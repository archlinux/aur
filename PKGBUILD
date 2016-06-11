# Maintainer: Leo Schwarz aka. evotopid <mail αt leoschwarz Døt com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com> 
_name=firefox
_channel=developer
pkgname="${_name}-${_channel}-de"
pkgdesc='Standalone web browser from mozilla.org, developer build - German'
url='http://www.mozilla.org/firefox/developer'
pkgver=49.0a2
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
_file="${_name}-${pkgver}.de.linux-${CARCH}"
_srcurl="https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n"
source=("${_srcurl}/${_file}.tar.bz2" "firefox-$_channel.desktop" "vendor.js")
depends=('alsa-lib' 'libxt' 'libnotify' 'mime-types' 'nss' 'gtk2' 'sqlite3' 'dbus-glib')
provides=(firefox-developer)
conflicts=(firefox-developer)

package() {
  install -d $pkgdir/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox $pkgdir/opt/firefox-$_channel

  ln -s /opt/firefox-$_channel/firefox $pkgdir/usr/bin/firefox-$_channel
  install -m644 $srcdir/firefox-$_channel.desktop $pkgdir/usr/share/applications/
  install -m644 $srcdir/firefox/browser/icons/mozicon128.png $pkgdir/usr/share/pixmaps/$pkgname-icon.png
  install -Dm644 $srcdir/vendor.js $pkgdir/opt/firefox-$_channel/browser/defaults/preferences/vendor.js
}

md5sums=('19d96983e9809c813fbbf2d1b5cea201'
         '5979b30b19cd645012ce518321fb16f1'
         '32618013911bf84445afce815e3875b1')
