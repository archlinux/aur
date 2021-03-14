# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=firedragon-bin
provides=(${pkgname//-bin/""})
conflicts=(${pkgname//-bin/""})
pkgver=88.0a1.r638601+
pkgrel=1
pkgdesc="Librewolf fork build using Nightly sources with custom branding, Proton UI rework & Fission enabled - binary version"
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://gitlab.com/dr460nf1r3/settings/"
depends=(gtk3 libxt mime-types dbus-glib
         ffmpeg nss-hg ttf-font libpulse
         libvpx libjpeg zlib icu libevent libpipewire02)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English'
            'libappindicator-gtk3: Global menu support for GTK apps'
            'appmenu-gtk-module-git: Appmenu for GTK only'
            'plasma5-applets-window-appmenu: Appmenu for Plasma only')
options=(!emptydirs)
replaces=('dragonwolf')
install=firedragon-bin.install
_uploadpath_x86_64="https://builds.garudalinux.org/repos/chaotic-aur/x86_64/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_x86_64=("${_uploadpath_x86_64}")
sha256sums_x86_64=('b2df3dbc9488bc262c4306b94a2c8d10e473c919b024c4c810da4c9f5376274f')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
