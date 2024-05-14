# Maintainer: Escape0707 <tothesong at gmail dot com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='Audio device and application capture for OBS Studio using PipeWire'
arch=('x86_64')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL-2.0-only')
depends=('obs-studio' 'wireplumber')
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
provides=('obs-pipewire-audio-capture')
conflicts=('obs-pipewire-audio-capture')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/linux-pipewire-audio-$pkgver.tar.gz)
b2sums=('260aa968143b20121a24b42b7cad44be317c285327eb907d4469af1321717f3556a1f84f07cf0f2b6cdddd91539fabf2e08216e8f11d1eda49487cd3248a6b0e')

package() {
  install -Dm755 "${srcdir}/linux-pipewire-audio/bin/64bit/linux-pipewire-audio.so" "${pkgdir}/usr/lib/obs-plugins/linux-pipewire-audio.so"
  install -Dm644 "${srcdir}/linux-pipewire-audio/data/locale/"*.ini -t "${pkgdir}/usr/share/obs/obs-plugins/linux-pipewire-audio/locale/"
}
