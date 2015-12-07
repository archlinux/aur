# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=tunefish4
pkgname="${_pkgname}-vst-bin"
pkgver=4.0.1
pkgrel=1
pkgdesc="An additive wavetable-based synthesizer VST plugin"
arch=('i686' 'x86_64')
url="http://www.tunefish-synth.com/"
# See https://github.com/paynebc/tunefish/blob/master/COPYING
license=("GPL3")
groups=('vst-plugins')
# glib2 and graphite are included, even if namcap thinks the dependencies are
# already satisfied, but this is caused by the cyclic dependency
# freetype <-> harbuzz
depends=('alsa-lib' 'glib2' 'freetype2' 'graphite' 'mesa')
source=()
source_i686=("http://www.tunefish-synth.com/downloads/tunefish-v${pkgver}-linux32-vst24.tar.gz")
source_x86_64=("http://www.tunefish-synth.com/downloads/tunefish-v${pkgver}-linux64-vst24.tar.gz")
sha256sums_i686=('3f4e4c336db48ce9cf922704bb38f82960eef85dc9c0a7a989d5032a1902c7e4')
sha256sums_x86_64=('9595aad67134631700aec4c4f2c5ae255d025493b3432ca4148b8fafbd9a5d84')

package() {
  install -dm755 "${pkgdir}/usr/lib/vst/tf4programs"
  install -m755 "${srcdir}/${_pkgname}.so" "${pkgdir}/usr/lib/vst"
  install -m644 "${srcdir}/tf4programs/"* "${pkgdir}/usr/lib/vst/tf4programs"
}

# vim:set ts=2 sw=2 et:
