# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-beta
pkgver=11.0.36
pkgrel=1
pkgdesc="Audio and MIDI Workstation (DAW)"
arch=('x86_64')
url="https://www.tracktion.com/"
license=('custom')
depends=('alsa-lib' 'curl' 'freetype2' 'libglvnd')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
)
conflicts=(
    'waveform-bundle'
    'tracktion-waveform'
)
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/${pkgver//./}/waveform_64bit_v${pkgver}.deb)
sha256sums=('d97bf74b3c6451a2dfd7da3973b85f7230d2324795a438e3a783d2aa0a1adf8c')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform11" "$pkgdir/usr/share/doc/$pkgname"
}
