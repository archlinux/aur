# Maintainer: kemal <kmal@cock.li>

pkgname=trivalent-bin
pkgver=141.0.7390.65
pkgrel=1
pkgdesc="A hardened chromium for desktop Linux inspired by Vanadium."
arch=('x86_64')
url="https://github.com/secureblue/Trivalent"
license=('(GPL-2.0-only WITH (Apache-2.0-note AND FTL-note AND WebView-note)) AND BSD-3-Clause AND LGPL-2.1-or-later AND Apache-2.0 AND IJG AND MIT AND GPL-2.0-or-later AND ISC AND OpenSSL AND (MPL-1.1 OR GPL-2.0-only OR LGPL-2.0-only)')
depends=('gtk4' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
         'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
         'libffi' 'desktop-file-utils' 'hicolor-icon-theme' 'brotli' 'flac'
         'fontconfig' 'freetype2' 'harfbuzz' 'icu' 'libjpeg-turbo' 'libpng'
         'libwebp' 'libxml2' 'libxslt' 'opus' 'minizip' 'bubblewrap')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk3: legacy'
            'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
            'kwallet: support for storing passwords in KWallet on Plasma'
            'upower: Battery Status API support'
            'qt6-base: QT UI support')
source=("https://repo.secureblue.dev/Packages/trivalent-141.0.7390.65-439968.x86_64.rpm"
        "https://repo.secureblue.dev/Packages/trivalent-qt6-ui-141.0.7390.65-439968.x86_64.rpm")
sha256sums=('db474518d619b16bfa21a7d24d7efcb5bf8cbc2bb4ea9b6441a5ca92ccc1f3f4'
            '690af1e86391f50ef84b2124dc9a82447ed59c46dc40b522c74d7f8b180fad7b')

prepare() {
	mv "${srcdir}/usr/lib64" "${srcdir}/usr/lib"
}

package() {
    cp -r "${srcdir}/usr/" "${pkgdir}/usr"
    cp -r "${srcdir}/etc/" "${pkgdir}/etc"
}
