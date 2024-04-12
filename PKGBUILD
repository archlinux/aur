# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
gitname=cassette
pkgname=("${gitname}")
pkgver=0.1
pkgrel=4
pkgdesc="GTK4/Adwaita приложение, которое позволит вам использовать Я.Музыку на Linux."
arch=('x86_64')
url="https://github.com/rirusha/${gitname}"
license=('GPL3')
depends=('glib2' 'gtk4' 'libgee' 'libadwaita' 'libsoup3' 'json-glib' 'sqlite3' 'libxml2' 'gstreamer' 'webkitgtk-6.0' ) 
optdepends=()
makedepends=('meson' 'ninja' 'cmake' 'blueprint-compiler' 'git' 'gcc' 'vala'  'appstream-glib' 'python-packaging')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')

build() {
    cd "${gitname}/"
    meson setup _build
    ninja -C _build
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

