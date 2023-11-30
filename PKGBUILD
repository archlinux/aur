# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot xyz>

__pkgname=firedragon
_pkgname=$__pkgname-unsigned-extensions
pkgname=$_pkgname-bin
_pkgver=120.0.1-1
pkgver=${_pkgver//-/.r}
pkgrel=1
pkgdesc="FireDragon modified to allow installation of unsigned extensions"
_arch=x86_64
arch=($_arch)
backup=('usr/lib/firedragon/firedragon.cfg'
  'usr/lib/firedragon/distribution/policies.json')
license=(MPL GPL LGPL)
url=https://gitlab.com/dr460nf1r3/settings/
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font libpulse ffmpeg xdg-desktop-portal)
optdepends=('firejail-git: Sandboxing the browser using the included profiles'
  'profile-sync-daemon: Load the browser profile into RAM'
  'whoogle: Searching the web using a locally running Whoogle instance'
  'searx: Searching the web using a locally running searX instance'
  'networkmanager: Location detection via available WiFi networks'
  'libnotify: Notification integration'
  'pulseaudio: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'hunspell-en_US: Spell checking, American English'
  'libappindicator-gtk3: Global menu support for GTK apps'
  'appmenu-gtk-module-git: Appmenu for GTK only'
  'plasma5-applets-window-appmenu: Appmenu for Plasma only')
provides=($__pkgname)
conflicts=($__pkgname)
options=(!emptydirs !strip)
install=$__pkgname.install
source=("https://codeberg.org/stefanwimmer128/firedragon-unsigned-extensions/releases/download/$_pkgver/$_pkgname-$_pkgver-$_arch.pkg.tar.zst")
sha256sums=('760bdab196a2fbac76cae948e6223c39eb2265e8b5e110ae7b1cf0949ee0a7da')

build() {
  rm "$_pkgname-$_pkgver-$_arch.pkg.tar.zst"
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
