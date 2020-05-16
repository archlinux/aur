# Mantainer: Alexandros Theodotou <alex at zrythm dot org>
# based on PKGBUILD by: Jeff Hubbard <musikernel@gmail.com>

_pkgbase=ladspa-sdk
MINGW_PACKAGE_PREFIX=mingw-w64
pkgname=$MINGW_PACKAGE_PREFIX-$_pkgbase
pkgver=1.15
pkgrel=1
pkgdesc="Time-stretching and pitch-shifting audio library and utility"
arch=('any')
url="https://www.gnome.org"
license=("LGPL")
options=('!buildflags' '!strip' 'staticlibs')
makedepends=("${MINGW_PACKAGE_PREFIX}-meson")
depends=("${MINGW_PACKAGE_PREFIX}-fftw"
	"${MINGW_PACKAGE_PREFIX}-libsamplerate"
	"${MINGW_PACKAGE_PREFIX}-vamp-plugin-sdk")
source=("https://ladspa.org/download/ladspa_sdk_${pkgver}.tgz")
sha256sums=('4229959b09d20c88c8c86f4aa76427843011705df22d9c28b38359fd1829fded')
noextract=(ladspa_sdk_${pkgver}.tgz)
_architectures=('x86_64-w64-mingw32')

prepare() {

	tar -xzf ${srcdir}/ladspa_sdk_${pkgver}.tgz -C ${srcdir} || true
}

package() {
	cd ladspa_sdk_${pkgver}
	install -Dm0644 src/ladspa.h "${pkgdir}/usr/x86_64-w64-mingw32/include/ladspa.h"
}

