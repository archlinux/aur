#!/usr/bin/env bash

__pkgname=firedragon
_pkgname=$__pkgname-unsigned-extensions
pkgname=$_pkgname-bin
pkgver=111.0.r3
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
provides=($__pkgname)
conflicts=($__pkgname)
options=(!emptydirs !strip)
install=$__pkgname.install
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.io/stefanwimmer128/firedragon-unsigned-extensions/-/package_files/77/download")
sha256sums=('4ab395f69becde2c7a0ec95d7efd268a7e16fe17e6ec4e29e13e903e53533f43')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
