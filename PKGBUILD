# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2026.8.5
pkgrel=1
pkgdesc="Download manager based on aria2"
arch=('any')
url="https://giantpinkrobots.github.io/varia/"
license=('MPL-2.0')
depends=('7zip'
         'aria2'
         'aria2p'
         'bash'
         'dconf'
         'deno'
         'ffmpeg'
         'glib2'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'libayatana-appindicator'
         'libtorrent-rasterbar'
         'pango'
         'python'
         'python-dbus-next'
         'python-emoji-country-flag'
         'python-gobject'
         'python-pillow'
         'python-pystray'
         'python-requests'
         'yt-dlp')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giantpinkrobots/varia/archive/v${pkgver}.tar.gz")
sha256sums=('fc95eb507867498586d176e4552c957f106cf1b83633d06800da0ea1c5d41343')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
