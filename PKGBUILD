# Maintainer: marcomorosi06 <marcomorosi.dev@gmail.com>
pkgname=wifi-audio-streaming-desktop
pkgver=1.0
pkgrel=1
pkgdesc="Share your desktop audio in your LAN via WiFi"
arch=('x86_64')
url="https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop"
license=('EUPL-1.2')
depends=('glibc' 'alsa-lib' 'libpulse')
source=("https://github.com/marcomorosi06/WiFiAudioStreaming-Desktop/releases/download/v1.0/TAR-WiFiAudioStreaming-v1.0.tar.gz")
sha256sums=('e59371b31d47ee4be43698f7de55ab6f9300ef55dbd926094bbc93fe245420ff')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r "${srcdir}/app/"* "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/WiFi Audio Streaming/bin/WiFi Audio Streaming" "${pkgdir}/usr/bin/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" << DESKTOP
[Desktop Entry]
Name=WiFi Audio Streaming
Exec=${pkgname}
Type=Application
Categories=Audio;Network;
DESKTOP
}
