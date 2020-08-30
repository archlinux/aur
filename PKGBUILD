# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: Thomas Baechler <thomas.baechler@rwth-aachen.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=bin2iso
pkgver=1.9b
_dlver=${pkgver/./}
pkgrel=6
pkgdesc="Converts RAW format (.bin/.cue) files to ISO/WAV format"
arch=(x86_64 i686 pentium4 arm armv6h armv7h aarch64)
url="http://xpt.sourceforge.net/techdocs/media/video/dvdvcd/dv09-NonIsoCDFormats/ar01s10.html"
license=('GPL')
depends=('glibc')
source=("http://slackware.uk/sbosrcarch/by-name/system/$pkgname/$pkgname${_dlver}_linux.c")
sha256sums=('1e8a6ae79e91325acd50f3a0e506edf4d8cb57b72d1dcfd8b276a04aff82e43d')

package() {
  cd "$srcdir"

  [ -z "$CC" ] && CC=gcc
  $CC $CFLAGS -Wall -o "$pkgname" "$pkgname${_dlver}_linux.c"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

