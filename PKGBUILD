# Maintainer: dr460nf1r3 <dr460nf1r3@garudalinux.org>

pkgname=firedragon-stable-bin
provides=(${pkgname//-bin/""} firedragon)
conflicts=(${pkgname//-bin/""} firedragon)
pkgver=87.0
pkgrel=1
pkgdesc="Librewolf fork build using custom branding & new features using stable as source. Binary version"
arch=(x86_64 aarch64)
license=(MPL GPL LGPL)
url="https://gitlab.com/dr460nf1r3/settings/"
depends=(gtk3 libxt mime-types dbus-glib ffmpeg nss ttf-font libpulse whoogle-git
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
install=firedragon-stable-bin.install
_uploadpath_x86_64="https://builds.garudalinux.org/repos/chaotic-aur/x86_64/${pkgname//-bin/""}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst"
source_x86_64=("${_uploadpath_x86_64}")
sha256sums_x86_64=('SKIP')

package() {
  # Yep, that's somewhat redundant. But it works.
  cp -r "${srcdir}"/usr "${pkgdir}"/
}
