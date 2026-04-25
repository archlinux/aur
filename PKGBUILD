# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2026.3.27
pkgrel=2
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
sha256sums=('e58be0b8be6bc7de3fe005e7b3b06d1b2b0080072774a88d04a5fdc6370d262e')

build() {
    arch-meson "${pkgname}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
