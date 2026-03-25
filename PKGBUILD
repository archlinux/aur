# Maintainer: nerdyslacker <karyan40024@gmail.com>
pkgname=dinox
pkgver=1.1.7.8
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
sha256sums=('e3853c5826bd8dda5b124915da86accd125cc962c073902bc39c66f4d3841290')

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
