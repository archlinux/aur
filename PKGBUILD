# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
pkgver=1.6.0
pkgrel=1
pkgdesc="Bring your music library together"
arch=('any')
url="https://github.com/Jeffser/Nocturne"
license=('GPL-3.0-or-later')
depends=('dconf'
         'glib2'
         'glycin'
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
         'python-tinytag'
         'python-urllib3')
makedepends=('blueprint-compiler' 'meson')
optdepends=('gst-plugin-gtk4: for video rendering'
            'gst-plugins-bad: extra media codecs'
            'gst-plugins-good: extra media codecs'
            'gst-plugins-ugly: extra media codecs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('02cfe0c5bf63031e3d79beba36f8f231d6638a8b03176ed91038d90ec48c5b91')

build() {
    arch-meson "${pkgname^}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
