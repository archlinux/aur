# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

pkgname=varia
pkgver=2026.3.27
_pkgver=2026.1.5-3
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/giantpinkrobots/varia/archive/v${_pkgver}.tar.gz")
sha256sums=('01dc36ee71f40666219ee70699dd8350116a18b94b4c3931c16a1fc18e2d0afc')

build() {
    arch-meson "${pkgname}-${_pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
