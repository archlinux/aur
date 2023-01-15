# Maintainer: Robin Trioux <robin@trioux.ovh>
# Maintainer: Dan Trickey
# Contributor: Dan Trickey
# Contributor: Robin Trioux
# This file is inspired by Dan Trickey PKGBUILD's

pkgname=webots-bin
pkgver=2023a
pkgrel=1
pkgdesc="Mobile robot simulation software."
arch=('x86_64')
url="https://cyberbotics.com/"
license=('Apache')
depends=("make" "gcc" "atk>=1.9.0" "ffmpeg" "dbus" "freeimage>=3.15.4" "glib2>2.10.0" "glu"
         "gtk3" "nss" "gcc-libs" "libxaw" "libxrandr" "libxrender"
         "zziplib>=0.13.62" "libssh" "libzip" "libx11" "xorg-server" "libxslt" "gd"
         "freetype2")
optdepends=('alsa-lib' 'cairo'  'dbus' 'desktop-file-utils' 'expat' 'fontconfig' 'gdk-pixbuf2' 'hicolor-icon-theme' 'jre-openjdk-headless' 'libcups' 'libglvnd' 'libjpeg-turbo' 'libpulse' 'libxaw' 'libxcb' 'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes' 'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'libxrender' 'libxtst' 'nspr' 'nss' 'openal' 'openssl' 'pango' 'qt6-base' 'qt6-declarative' 'qt6-positioning' 'qt6-multimedia' 'qt6-webchannel' 'qt6-webengine' 'qt6-websockets' 'xorg-server' 'zlib')
conflicts=('webots')
options=('!strip' '!emptydirs')
install=webots.install
source_x86_64=('https://github.com/cyberbotics/webots/releases/download/R2023a/webots_2023a_amd64.deb')
sha512sums_x86_64=('cd604ff84ae07977b74ba46e508a29435829ff3909fbb0bd2fb3547edcc4011c38d0e160de8831b4e24ea6e3d8d0095a969908f2a6ac30a65bd0457895f7160c')

package(){

	# Extract package data
	tar xzf data.tar.gz -C "${pkgdir}"

	# Fix directory structure differences
	cd "${pkgdir}"

	mkdir usr/bin 2> /dev/null; mv usr/local/bin/* usr/bin; rm -rf usr/local/bin

	cd ..

}
 
