# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tunefish4
pkgname="${_pkgname}-vst-bin"
pkgver=4.1.0
pkgrel=1
pkgdesc="An additive wavetable-based synthesizer VST plugin"
arch=('x86_64')
url="http://www.tunefish-synth.com/"
# See https://github.com/paynebc/tunefish/blob/master/COPYING
license=("GPL3")
groups=('vst-plugins')
# glib2 and graphite are included, even if namcap thinks the dependencies are
# already satisfied, but this is caused by the cyclic dependency
# freetype <-> harfbuzz
depends=('alsa-lib' 'glib2' 'freetype2' 'graphite' 'mesa')
source=()
source_x86_64=("http://www.tunefish-synth.com/downloads/tunefish-v${pkgver}-linux64-vst24.tar.gz")
sha256sums_x86_64=('4959046c766441c527455bb43fa9a4ca702f76263355751cefe8c5ba325b4656')

package() {
  install -dm755 "${pkgdir}/usr/lib/vst/tf4programs"
  install -m755 "${srcdir}/Tunefish4.so" "${pkgdir}/usr/lib/vst"
  install -m644 "${srcdir}/tf4programs/"* "${pkgdir}/usr/lib/vst/tf4programs"
}

# vim:set ts=2 sw=2 et:
