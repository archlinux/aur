### Original firefox from extra ###
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

### Appmenu patching ###
# PKGBUILD: Nikita Tarasov <nikatar@disroot.org>
# Building: Nikita Tarasov <nikatar@disroot.org>

pkgname=firefox-appmenu-bin
_pkgname=firefox
pkgver=108.0.2
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Firefox-appmenu, binary version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://aur.archlinux.org/packages/firefox-appmenu/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse libdbusmenu-gtk3)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'xdg-desktop-portal: Screensharing with Wayland')

provides=("firefox=$pkgver")
conflicts=("firefox")
options=(!emptydirs !makeflags !strip)
source=(https://github.com/nikatar/AUR/raw/master/firefox-appmenu-bin/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst{,.sig})
noextract=(firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst)
validpgpkeys=(85F86E317555BECC1C2184BF2C45BA09ABC5D7DA)
sha256sums=(
	'6bf61bf2a60589319c9e6b11068be6fbac4d5b0f971dc5389348fa836aa5d196'
	'SKIP'
)

package() {
	tar -xf $srcdir/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst -C $pkgdir --exclude=".*"
}
