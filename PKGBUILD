# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform
pkgver=13.1.18
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
  'tracktion-waveform-beta'
)

source_aarch64=(https://cdn.tracktion.com/file/tracktiondownload/w13/${pkgver//./}/waveform13_${pkgver}_arm64.deb)
source_x86_64=(https://cdn.tracktion.com/file/tracktiondownload/w13/${pkgver//./}/waveform13_${pkgver}_amd64.deb)
sha256sums_x86_64=('5859b6e2ce75b1e106435c945ac648c197e5aa065f9d883d2ae43fbd2097dea0')
sha256sums_aarch64=('c215c984e09fae2ff91a4797b22daff13234679b8bf0d53acffc6f49cd123a00')

package() {
    tar -x --gz -f data.tar.gz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/Waveform13" "$pkgdir/usr/share/doc/$pkgname"
}
