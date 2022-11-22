# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Dan Trickey

pkgname=webots-nightly
pkgver=2023a_2022_11_21
_buildver=21_11_2022
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
source=("${pkgname}-${pkgver//_/-}-amd64.deb::${url}/releases/download/nightly_${_buildver}/${pkgname%-nightly}_${pkgver%%_*}_amd64.deb")
sha512sums=('c58f9bfa97a51a147f2076ede0d755bfe201999baab1dc0e3613e68c8f5ed542ae406d497da4950f4d2fd08ec557828364502d421c6f1affea41df391b391322')

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
