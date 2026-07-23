# Maintainer: nerdyslacker <karyan40024@gmail.com>
pkgname=dinox
pkgver=2.2.1
pkgrel=1
pkgdesc="Modern XMPP Chat Client with Video Calls, Voice Messages & OMEMO 1 + 2 Encryption & API Botmother and AI API DTMF MQTT Support"
url="https://git.dinox.im/dinoxim/dinox"
arch=('x86_64')
license=('GPL-3.0-only')

depends=(
    glib2
    glib-networking
    gtk4
    libadwaita
    gpgme
    libgee
    libgcrypt
    libsoup3
    sqlcipher
    libsecret
    icu
    libdbusmenu-glib
    json-glib
    qrencode
    libnice
    gstreamer
    gst-plugin-gtk
    gst-plugins-base
    gst-plugins-good
    gst-plugins-bad
    gst-plugin-pipewire
    libsrtp
    gnutls
    webrtc-audio-processing
    gdk-pixbuf2
    mosquitto
    libcanberra
    cjson
    geoclue
    libnotify
    readline
    sqlite
    openssl
    libunwind
    libva
    libheif
    webp-pixbuf-loader
    tor    
)

makedepends=(
    git
    meson
    ninja
    vala
    cmake
    gettext
    pkgconf
    python
    tcl
    go
)

source=("https://git.dinox.im/dinoxim/dinox/archive/v${pkgver}.tar.gz")
sha256sums=('71f3276d6ea09c0e585fbd271878480bbe93b92e11774922a59b2fd84f848dab')

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
