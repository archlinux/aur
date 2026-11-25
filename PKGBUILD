# Maintainer: gaou-piou <i.am.piou@gmail.com>
#
# Packaged from upstream's rolling "nightly" GitHub release (the last tagged release, 1.5.2,
# is from 2020). Each nightly build REPLACES the previous assets, so the source URL below
# stops working once upstream publishes a newer build: run ./update-nightly.sh to bump.
#
# The nightly XPI is NOT signed by Mozilla. It still loads because it is installed in the
# application scope (/usr/lib/firefox/browser/extensions) and Arch-style Firefox builds are
# configured with --with-unsigned-addon-scopes=app,system (AppConstants.MOZ_UNSIGNED_APP_SCOPE).

pkgname=firefox-extension-xbrowsersync
_extension=xbrowsersync
_tag=1.8.0-beta.261
pkgver=${_tag/-/}
pkgrel=1
pkgdesc='xBrowserSync: free, open-source, anonymous and secure bookmark sync (Firefox extension, nightly build)'
arch=('any')
url='https://www.xbrowsersync.org'
license=('GPL-3.0-only')
groups=('firefox-addons')
optdepends=('firefox: the extension is installed for the system Firefox')
source=("$_extension-$pkgver.xpi::https://github.com/xbrowsersync/app/releases/download/nightly/xbrowsersync_${_tag}_firefox.xpi")
noextract=("$_extension-$pkgver.xpi")
sha256sums=('f416b19970ae303c9c3727c23ee76e3627bd0a6667f94bc02780b3bdf59027a2')
_extid='{019b606a-6f61-4d01-af2a-cea528f606da}'

package() {
  install -Dm644 "$_extension-$pkgver.xpi" \
    "$pkgdir/usr/lib/firefox/browser/extensions/$_extid.xpi"
}
