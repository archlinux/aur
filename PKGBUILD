# Maintainer: <aggraef at gmail.com>

# This is Jonathan Wilkes' nw.js variant of Pd-L2Ork nick-named "Purr-Data".
# Basically, it is Pd-L2Ork with the Tk GUI replaced with a JavaScript GUI
# implemented using nw.js (http://nwjs.io/).

# This is a binary package created directly from the latest upstream Debian
# package at https://git.purrdata.net/jwilkes/purr-data-binaries. If you want
# a package built specifically for Arch systems then use the purr-data or
# purr-data-git package instead, also available in the AUR.

# NOTE: This is experimental ALPHA software which is still heavily under
# development, so expect some bugs. If you want a version of Pd-L2Ork ready
# for production use, use the pd-l2ork or pd-l2ork-git package instead.

pkgname=purr-data-bin
pkgver=a2
pkgrel=1
pkgdesc="Jonathan Wilkes' nw.js variant of Pd-L2Ork (upstream Debian package)"
arch=('x86_64')
url="https://git.purrdata.net/jwilkes/purr-data"
license=('BSD')
depends=('bluez-libs' 'desktop-file-utils' 'dssi' 'fftw'
  'flite1' 'fluidsynth' 'freeglut' 'ftgl' 'glew' 'gmerlin'
  'gsl' 'gsm' 'hicolor-icon-theme' 'imagemagick' 'jack' 'ladspa' 'lame'
  'libdc1394' 'libdv' 'libgl' 'libiec61883' 'libjpeg' 'libquicktime'
  'libxxf86vm' 'libtiff' 'libiec61883' 'libunicap' 'libraw1394'
  'libsndobj-git' 'libv4l' 'libvorbis' 'lua51' 'portaudio'
  'smpeg' 'speex' 'stk' 'tk' 'tkpng' 'vlc' 'xapian-tcl-bindings' 'zlib'
  'alsa-lib' 'gconf' 'gtk2' 'nss' 'libxtst' 'libxss')
provides=('purr-data' 'pd-l2ork')
conflicts=('purr-data' 'pd-l2ork')
source=(https://git.purrdata.net/jwilkes/purr-data-binaries/raw/master/purr-data-ubuntu-16.04-x86_64-$pkgver.deb)
md5sums=('d89ead4969b8beedd668eb68a818371b')

prepare() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"
    cp -a etc usr "$pkgdir"
}
