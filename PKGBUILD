# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jakub Schmidtke <sjakub@gmail.com>
# Additional patching: Nikita Tarasov <nikatar@disroot.org>
# Compilation: Matt Hoffman <mattyhoffman7@gmail.com>

pkgname=firefox-appmenu-bin
_pkgname=firefox
pkgver=69.0.1
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Firefox-appmenu, binary version"
arch=(x86_64)
license=(MPL GPL LGPL)
url="https://www.mozilla.org/firefox/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib
         ffmpeg nss ttf-font libpulse)
makedepends=(unzip zip diffutils python2-setuptools yasm mesa imake inetutils
             xorg-server-xvfb autoconf2.13 rust clang llvm jack gtk2
             python nodejs python2-psutil cbindgen nasm)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
provides=("firefox=$pkgver")
conflict=("firefox")
options=(!emptydirs !makeflags !strip)
source=(https://gitlab.com/nikatar/aur-gitlab/raw/master/firefox-appmenu-bin/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz{,.sig})
noextract=(firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz)
validpgpkeys=(85F86E317555BECC1C2184BF2C45BA09ABC5D7DA)
sha256sums=(
	'64430bc3839cf2fa9bf244dedf2fb8b9d6f9020e663e55f1fc2827144a9e629c'
	'SKIP'
)

package() {
	tar -xf $srcdir/firefox-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz -C $pkgdir --exclude=".*"
}
