# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=134.0.6998.88
pkgrel=1
pkgdesc="A hardened chromium for desktop Linux inspired by Vanadium."
arch=('x86_64')
url="https://github.com/secureblue/Trivalent"
license=('BSD-3-Clause AND LGPL-2.1-or-later AND Apache-2.0 AND IJG AND MIT AND GPL-2.0-or-later AND ISC AND OpenSSL AND (MPL-1.1 OR GPL-2.0-only OR LGPL-2.0-only')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme' 'brotli' 'flac'
         'fontconfig' 'freetype2' 'harfbuzz' 'icu' 'libjpeg-turbo' 'libpng'
         'libwebp' 'libxml2' 'libxslt' 'opus' 'minizip')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support')
source=("https://repo.secureblue.dev/Packages/trivalent-134.0.6998.88-435428.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-common-134.0.6998.88-435428.x86_64.rpm")
sha256sums=('6c8318da2c05b5acd2a1c68eca6406e2d1ad5c8968800913484ac58596bf9274'
            '16596bf7ce1317bae699d5fd0a2915ac288cf63108d5719931f19d44253f0157')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
	rm "${srcdir}"/usr/lib/trivalent/*.so*
}

package() {
    cp -r "${srcdir}"/* "${pkgdir}"
}
