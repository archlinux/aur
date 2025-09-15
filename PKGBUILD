# Maintainer: Escape0707 <tothesong at gmail dot com>
# Contributor: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture-bin
pkgver=1.2.1
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
b2sums=('5b891aa1da69d12f8e13abaa36d1492577152c65eae8978d6feaf126a73b540050b5d7d5f86b36888fc919674bc28752b94803353e1c9aa47134cebaf8eaf457')

package() {
  install -Dm755 "${srcdir}/linux-pipewire-audio/bin/64bit/linux-pipewire-audio.so" "${pkgdir}/usr/lib/obs-plugins/linux-pipewire-audio.so"
  install -Dm644 "${srcdir}/linux-pipewire-audio/data/locale/"*.ini -t "${pkgdir}/usr/share/obs/obs-plugins/linux-pipewire-audio/locale/"
}
