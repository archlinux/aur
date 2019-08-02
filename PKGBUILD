# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-beta
pkgver=10.2.4
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
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/1024/waveform_64bit_v10.2.4.deb)
sha256sums=('431da6433d33199eaf2a107e523ae041800c48174feaf20be21b2ba28073496e')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform10" "$pkgdir/usr/share/doc/$pkgname"
}
