# Maintainer: bill-auger <bill-auger@programmer.net>
# AUR Maintainer: lucifermstar<8bit.demoncoder@gmail.com>
pkgname=av-caster
pkgver=0.16.003
pkgrel=1
epoch=
pkgdesc="A simple native gStreamer GUI for screencast, webcam, and audio streaming"
arch=('i686' 'x86_64')
url="https://github.com/bill-auger/av-caster"
license=('LGPL3')
groups=()
depends=( 'gst-plugins-bad' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-ugly' 'gstreamer' )
makedepends=( 'alsa-lib' 'curl' 'freeglut' 'freetype2' 'gcc' 'jack' 'libircclient' 'libx11' 'libxcomposite' 'libxcursor' 'libxinerama' 'libxrandr' 'mesa' )
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
rootdir="$pkgname"-"$pkgver"
source=('https://github.com/bill-auger/av-caster/archive/v'"$pkgver"'.tar.gz')
noextract=()
md5sums=('af3c934f64d355fc539578c3bc9486b2')
validpgpkeys=()

#prepare() {}

build() {
  cd "$rootdir"/Builds/Makefile/
  make CONFIG=Release
}

#check() { [ -f "$rootdir"/Builds/Makefile/build/av-caster ] }

package() {
  mkdir -p $pkgdir/usr/bin/
  cd "$rootdir"
  cp Builds/Makefile/build/av-caster $pkgdir/usr/bin/
}
