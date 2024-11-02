# Maintainer: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-waveform
pkgver=13.2.0
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
sha256sums_x86_64=('eb84aa44eb05026c81d09eb290e97261bdde5be286c10406d80bc8a5f11d7854')
sha256sums_aarch64=('2b5410f14b8ea4419866033da9fdb6f722cdd887f7b69ffb3d469bbd90c3560f')

package() {
    tar -x --gz -f data.tar.gz -C "${pkgdir}"
    install -D -m 644 "$startdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mv "$pkgdir/usr/share/doc/Waveform13" "$pkgdir/usr/share/doc/$pkgname"
}
