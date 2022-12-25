#!/usr/bin/env bash

pkgname=firedragon-unsigned-extensions-bin
_pkgname=FireDragon
__pkgname=firedragon
___pkgname=firedragon-unsigned-extensions
pkgver=108.0.1
pkgrel=1
pkgdesc="FireDragon modified to allow installation of unsigned extensions"
arch=(x86_64)
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
provides=("firedragon")
conflicts=("firedragon")
options=(!emptydirs !strip)
install=$__pkgname.install
source=("$___pkgname-$pkgver-$pkgrel.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/firedragon-unsigned-extensions/-/package_files/46/download")
sha256sums=('cef12ceb70d339dfc126d1f9efbc4e120a28155a08003c5a2dcedd2aa0d30214')

build() {
  rm "$___pkgname-$pkgver-$pkgrel.tar.zst"
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
