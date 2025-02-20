# Maintainer: Robin Trioux <robin@trioux.ovh>
# Maintainer: Dan Trickey
# Contributor: Dan Trickey
# Contributor: Robin Trioux
# This file is inspired by Dan Trickey PKGBUILD's

pkgname=webots-bin
pkgver=2025a
pkgrel=1
pkgdesc="Mobile robot simulation software."
arch=('x86_64')
url="https://cyberbotics.com/"
license=('Apache')
depends=("make" "gcc" "atk>=1.9.0" "ffmpeg" "dbus" "freeimage>=3.15.4" "glib2>2.10.0" "glu"
         "gtk3" "nss" "gcc-libs" "libxaw" "libxrandr" "libxrender"
         "zziplib>=0.13.62" "libssh" "libzip" "libx11" "xorg-server" "libxslt" "gd"
         "freetype2" "sndio")
optdepends=('alsa-lib' 'cairo'  'dbus' 'desktop-file-utils' 'expat' 'fontconfig' 'gdk-pixbuf2' 'hicolor-icon-theme' 'jre-openjdk-headless' 'libcups' 'libglvnd' 'libjpeg-turbo' 'libpulse' 'libxaw' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxtst' 'nspr' 'nss' 'openal' 'openssl' 'pango' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-multimedia' 'qt6-webchannel' 'qt6-webengine' 'qt6-websockets' 'xorg-server' 'zlib')
conflicts=('webots')
options=('!strip' '!emptydirs')
install=webots.install
source_x86_64=('https://github.com/cyberbotics/webots/releases/download/R2025a/webots_2025a_amd64.deb')
sha512sums_x86_64=('baee70c9e10aa39530e7efc6f84ad86ae943cbfa939229f45ed658f6d318ebfe119fc76ee78c49304c3468fb364c5e6e23d137c12b37cac023b364f955c8010f')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin

	cd ..

}
 
