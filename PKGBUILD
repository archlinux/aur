# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform-beta
pkgver=13.0.33
pkgrel=1
pkgdesc="Audio and MIDI Workstation (DAW)"
arch=('x86_64' 'aarch64')
url="https://www.tracktion.com/"
license=('custom')
depends=(
  'alsa-lib'
  'brotli'
  'bzip2'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'graphite'
  'harfbuzz'
  'icu'
  'libcap'
  'libffi'
  'libgcrypt'
  'libglvnd'
  'libgpg-error'
  'libpng'
  'libusb'
  'libx11'
  'libxau'
  'libxcb'
  'libxdmcp'
  'lz4'
  'pcre2'
  'systemd-libs'
  'util-linux-libs'
  'webkit2gtk'
  'xz'
  'zlib'
  'zstd'
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

source_aarch64=(https://cdn.tracktion.com/file/tracktiondownload/w13/${pkgver//./}/waveform13_${pkgver}_arm64.deb)
source_x86_64=(https://cdn.tracktion.com/file/tracktiondownload/w13/${pkgver//./}/waveform13_${pkgver}_amd64.deb)
sha256sums_x86_64=('48763425ee632076b1a0584a14c59ab1981327a8bad2e25748ca7c74c21906f3')
sha256sums_aarch64=('3e3a232db05064652c9d827d2c253678cc14611b9fe02a9e04f6dd6afe537d76')

package() {
    tar -x --gz -f data.tar.gz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/Waveform13" "$pkgdir/usr/share/doc/$pkgname"
}
