# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=jammr
pkgver=1
pkgrel=1
pkgdesc="jammr lets you play with musicians over the internet."
arch=('i686' 'x86_64')
url="https://www.jammr.net/"
options=('!strip')

source_x86_64=("https://jammr.net/static/jammr-client_amd64.deb")
md5sums_x86_64=('282de730400029e5ed749e93e71e8caf')

source_i686=("https://jammr.net/static/jammr-client_i386.deb")
md5sums_i686=('54c63f14b40814fd3845d44423ef1ba3')

depends=("libvorbis" "libogg" "libstdc++296" "portaudio" "portmidi" "qt5-base" "lpmlibs")

package() {
  tar xvfJ data.tar.xz
  mkdir -p $pkgdir/usr 
  mkdir -p $pkgdir/usr/bin
  cd $srcdir
  cp -r usr $pkgdir
  cp -r bin/jammr $pkgdir/usr/bin/jammr
  chmod -R 755 $pkgdir/usr/bin/jammr
  chmod -R 755 $pkgdir/usr/share/applications/jammr.desktop
}