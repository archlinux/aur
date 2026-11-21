# Maintainer: imxssible <https://dotify.fun>
pkgname=nodotify
pkgver=2.4.1
pkgrel=1
pkgdesc="Music without limits. Combines all popular platforms in one app (Spotify, SoundCloud, Yandex Music, Apple Music, YouTube Music)"
arch=('x86_64')
url="https://dotify.fun"
license=('custom:proprietary')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'libayatana-appindicator'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-plugins-bad'
    'gst-plugins-ugly'
    'gst-libav'
)
provides=('dotify')
conflicts=('dotify')
# the link always serves the latest build: the local name carries the version, so makepkg and
# AUR helpers do not reuse a .deb cached by an earlier release
source_x86_64=("dotify-${pkgver}.deb::https://dotify.fun/Dotify.deb")
sha256sums_x86_64=('d7d81b593548a0c4605e47d15c8e4c737394ea654943e610307c3ee025f6f22a')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
}
