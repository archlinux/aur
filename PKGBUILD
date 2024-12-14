# Maintainer: Rhys Perry <rhysperry111@gmail.com>
# Based on tracktion-waveform aur package from Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-9
pkgver=9.3.2
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
source=(https://cdn.tracktion.com/file/tracktiondownload/waveform/932/Waveform-installer-64bit-linux-9.3.2.deb)
md5sums=('98b466c2b8132d01b1698a3dfa4b7fe8')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -D -m 644 "$startdir/TRACKTION_LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/waveform9" "$pkgdir/usr/share/doc/$pkgname"
}
