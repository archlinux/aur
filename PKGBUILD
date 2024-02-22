# Maintainer: Loewetiger <loewetiger at tuta dot io>

pkgname=obs-pipewire-audio-capture-bin
pkgver=1.1.4
pkgrel=1
pkgdesc='PipeWire audio capturing for OBS Studio'
arch=('x86_64')
url='https://github.com/dimtpap/obs-pipewire-audio-capture'
license=('GPL2')
depends=('obs-studio>=28' 'wireplumber')
optdepends=('pipewire-pulse: record PulseAudio applications'
            'pipewire-jack: record JACK applications'
            'pipewire-alsa: record ALSA applications')
provides=('obs-pipewire-audio-capture')
conflicts=('obs-pipewire-audio-capture')
source=($pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/linux-pipewire-audio-$pkgver.tar.gz)
md5sums=('57f5abcf9a93ffd8d570fd0d56a61c4c')

package() {
  install -Dm 755 "${srcdir}"/linux-pipewire-audio/bin/64bit/linux-pipewire-audio.so "${pkgdir}"/usr/lib/obs-plugins/linux-pipewire-audio.so
  install -Dm 644 "${srcdir}"/linux-pipewire-audio/data/locale/en-US.ini "${pkgdir}"/usr/share/obs/obs-plugins/linux-pipewire-audio/locale/en-US.ini
}
