# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-beta
pkgver=12.1.6
pkgrel=1
pkgdesc="Audio and MIDI Workstation (DAW)"
arch=('x86_64')
url="https://www.tracktion.com/"
license=('custom')
depends=('gcc-libs'
  'alsa-lib'
  'curl'
  'freetype2'
  'libglvnd'
  'zlib'
  'bzip2'
  'libpng'
  'harfbuzz'
  'brotli'
  'graphite'
  'glib2'
  'libx11'
  'libxcb'
  'libxau'
  'libxdmcp'
  'pcre'
)
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
  'vst-plugins: A set of vst plugins'
  'vst3-plugins: A set of vst3 plugins'
)
conflicts=(
    'waveform-bundle'
    'tracktion-waveform'
)
source=(https://cdn.tracktion.com/file/tracktiondownload/w12/${pkgver//./}/waveform_64bit_v${pkgver}.deb)
sha256sums=('3395aab3b1863e2a87c3014f8aec6e88675f124fefd7a0dc2fdef9ad1745b2c7')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform12" "$pkgdir/usr/share/doc/$pkgname"
}
