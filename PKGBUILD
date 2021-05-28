# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform
pkgver=11.5.17
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
    'tracktion-waveform-beta'
)
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/${pkgver//./}/waveform_64bit_v${pkgver}.deb)
sha256sums=('0f74855f83aed29acbe6fab083cb29172a7f379ae323ad45ba9c281dffdacf72')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform11" "$pkgdir/usr/share/doc/$pkgname"
}
