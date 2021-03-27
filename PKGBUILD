### Original firefox from extra ###
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>

### Appmenu patching ###
# PKGBUILD: Nikita Tarasov <nikatar@disroot.org>
# Building: Arne Fahrenwalde <macgeneral@macgeneral.de>

pkgname=firefox-appmenu-bin
_pkgname=firefox
pkgver=87.0
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Firefox-appmenu, binary version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://aur.archlinux.org/packages/firefox-appmenu/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("firefox=$pkgver")
conflicts=("firefox")
options=(!emptydirs !makeflags !strip)
source=(https://github.com/nikatar/AUR/raw/master/firefox-appmenu-bin/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst{,.sig})
noextract=(firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst)
validpgpkeys=(85F86E317555BECC1C2184BF2C45BA09ABC5D7DA)
sha256sums=(
	'ff0206e3382e58f55e042164b4ef753780003d5f2c87ad0fe1a4ea7b3af61fb0'
	'SKIP'
)

package() {
	tar -xf $srcdir/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst -C $pkgdir --exclude=".*"
}
