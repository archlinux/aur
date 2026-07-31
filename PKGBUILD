# Maintainer:
# Contributor: Muhammed Emin Akalan <muhammedeminakalan@akalan.dev>

pkgname=nocturne
pkgver=1.5.1
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
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c8706fb9ebdd26fa890736d23cb2829c93bb1d48a0647a0adb634caa085c68e2')

build() {
    arch-meson "${pkgname^}-${pkgver}" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "${pkgdir}"
}
