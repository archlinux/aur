# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
pkgver=1.5.2
pkgrel=1
pkgdesc="Bring your music library together"
arch=('any')
url="https://github.com/Jeffser/Nocturne"
license=('GPL-3.0-or-later')
depends=('dconf'
         'glib2'
         'gstreamer'
         'gtk4'
         'hicolor-icon-theme'
         'libadwaita'
         'libportal'
         'libportal-gtk4'
         'libsecret'
         'pango'
         'python'
         'python-colorthief'
         'python-gobject'
         'python-mpris_server'
         'python-pillow'
         'python-pydbus'
         'python-requests'
         'python-syncedlyrics'
         'python-tinytag'
         'python-urllib3')
makedepends=('blueprint-compiler' 'meson')
optdepends=('gst-plugin-gtk4: for video rendering'
            'gst-plugins-bad: extra media codecs'
            'gst-plugins-good: extra media codecs'
            'gst-plugins-ugly: extra media codecs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1902291269980d6f0ccba56a23df8512852edb86587dff93f6fb78f920c0073d')

build() {
    arch-meson "${pkgname^}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
