# Maintainer: 'Radiolin' <anton.osi2011@gmail.com>
gitname=folio
pkgname=("${gitname}")
pkgver=24
pkgrel=10
pkgdesc="A beautiful markdown note-taking app for GNOME (forked from Paper)."
arch=('x86_64')
url="https://github.com/toolstack/${gitname}"
license=('GPL3')
depends=('glib2' 'gtk4' 'libgee' 'libadwaita' 'gtksourceview5') 
optdepends=()
makedepends=('git' 'vala' 'meson' 'base-devel')
provides=("$gitname")
conflicts=("$gitname")
source=("git+${url}.git")
md5sums=('SKIP')

build() {
    cd "${gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

