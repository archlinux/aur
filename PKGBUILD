# Maintainer: nerdyslacker <karyan40024@gmail.com>
pkgname=dinox
pkgver=1.1.5.4
pkgrel=1
pkgdesc="Modern XMPP Chat Client with Video Calls, Voice Messages & OMEMO 1 + 2 Encryption & API Botmother and AI API DTMF MQTT Support"
url="https://github.com/rallep71/dinox"
arch=('x86_64')
license=('GPL-3.0-only')

depends=('glib2' 'glib-networking' 'gtk4' 'libadwaita' 'gpgme' 'libgee' 'libgcrypt'
         'libsoup3' 'sqlcipher' 'libsecret' 'icu' 'libdbusmenu-glib'
         'json-glib' 'qrencode' 'libnice' 'gstreamer' 'gst-plugin-gtk'
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
         'gst-plugin-pipewire' 'libsrtp' 'gnutls'
         'webrtc-audio-processing' 'gdk-pixbuf2' 'mosquitto')

makedepends=('git' 'meson' 'vala' 'ninja')

source=("https://github.com/rallep71/dinox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a3ea55976da7e09c481f23786679e03b101c3c3034d81359b7d708ffa67e533')

build() {
	arch-meson "${pkgname}-${pkgver}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
