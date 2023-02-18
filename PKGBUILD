#!/usr/bin/env bash

__pkgname=firedragon
_pkgname=$__pkgname-unsigned-extensions
pkgname=$_pkgname-bin
pkgver=110.0.r1
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
source=("$_pkgname-$pkgver.tar.zst::https://git.stefanwimmer128.eu/stefanwimmer128/firedragon-unsigned-extensions/-/package_files/72/download")
sha256sums=('ef4e205c979d5e3b06108d2a045b7f67829dfdf7cf8fe1a35d5f3a66ab1e407e')

build() {
  rm "$_pkgname-$pkgver.tar.zst"
  rm .BUILDINFO .INSTALL .MTREE .PKGINFO
}

package() {
    cp -r . "$pkgdir"
}
