# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Dan Trickey
pkgname=webots-nightly
pkgver=2022b_2022_8_24
pkgrel=1
pkgdesc="Robot simulation software."
arch=('x86_64')
url="https://github.com/cyberbotics/webots"
license=('Apache')
depends=("make" "gcc" "atk>=1.9.0" "ffmpeg" "dbus" "freeimage>=3.15.4"
         "glib2>2.10.0" "glu" "gtk3" "nss" "gcc-libs" "libxaw" "libxrandr"
         "libxrender" "zziplib>=0.13.62" "libssh" "libzip" "libx11"
         "xorg-server" "libxslt" "gd" "freetype2")
optdepends=('alsa-lib' 'cairo'  'dbus' 'desktop-file-utils' 'expat'
	    'fontconfig' 'gdk-pixbuf2' 'hicolor-icon-theme' 'jre-openjdk-headless'
        'libcups' 'libglvnd' 'libjpeg-turbo' 'libpulse' 'libxaw' 'libxcb'
        'libxcomposite' 'libxcursor' 'libxdamage' 'libxext' 'libxfixes'
        'libxi' 'libxkbcommon' 'libxkbcommon-x11' 'libxrandr' 'libxrender'
        'libxtst' 'nspr' 'nss' 'openal' 'openssl' 'pango' 'qt5-base'
        'qt5-declarative' 'qt5-location' 'qt5-multimedia' 'qt5-webchannel'
        'qt5-webengine' 'qt5-websockets' 'xorg-server' 'zlib')
provides=("${pkgname%-nightly}")
conflicts=("${pkgname%-nightly}")
options=('!strip' '!emptydirs')
install=webots.install
source=("${pkgname}-${pkgver//_/-}-amd64.deb::${url}/releases/download/nightly_24_8_2022/webots_2022b_amd64.deb")
sha512sums=('4c949652a888970de8ab0f3c22e302ab81fd62ac9e29196665ce4f0ac2252948b7f685def15f74fad51d06fb15fa401c7bbfb4cb0b8b024c5bdd77ed29bcc2bb')

package(){
    # Extract package data
    tar xzf data.tar.gz -C "${pkgdir}"
    # Fix directory structure differences
    cd "${pkgdir}"
    mkdir usr/bin
    mv usr/local/bin/* usr/bin
    rm -rf usr/local/bin
}
# vim:set ts=4 sw=4 et:
