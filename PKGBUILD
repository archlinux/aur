# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2026.11.16
pkgrel=1
pkgdesc="Download manager based on aria2"
arch=('any')
url="https://giantpinkrobots.github.io/varia/"
license=('MPL-2.0')
depends=('7zip'
         'aria2-next'
         'aria2p'
         'bash'
         'dconf'
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
         'quickjs-ng'
         'yt-dlp')
makedepends=('meson')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giantpinkrobots/varia/archive/v${pkgver}.tar.gz")
sha256sums=('8d85ffe880da24600544ca9d2ca83636da51a7bf876714109f26c9028cd771e1')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
