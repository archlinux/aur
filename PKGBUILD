# Maintainer: gaou-piou <i.am.piou@gmail.com>

pkgname=firefox-extension-xbrowsersync
_extension=xbrowsersync
pkgver=1.5.2
pkgrel=1
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Firefox extension)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
groups=('firefox-addons')
optdepends=('firefox: the extension is installed for the system Firefox')
# Mozilla-signed release XPI (byte-identical to https://addons.mozilla.org/firefox/addon/xbs/)
source=("$_extension-$pkgver.xpi::https://github.com/xbrowsersync/app/releases/download/v$pkgver/xbrowsersync_${pkgver}_firefox.xpi")
noextract=("$_extension-$pkgver.xpi")
sha256sums=('8b58ad5498273e121b1ba5abaf108d2bc9f4fb4795bd5c7e6a3778196f7a0221')
_extid='{019b606a-6f61-4d01-af2a-cea528f606da}'

package() {
  install -Dm644 "$_extension-$pkgver.xpi" \
    "$pkgdir/usr/lib/firefox/browser/extensions/$_extid.xpi"
}
