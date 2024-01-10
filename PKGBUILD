# Maintainer: PaladinDev <paladingames1@gmail.com>
_pkgname=libflow
pkgname=libflow-git
_pkgver=rc.3
pkgver=${_pkgver/-/+}
pkgrel=1
pkgdesc='FlowGraph view for Gtk4'
arch=('x86_64')
url="https://github.com/SpikedPaladin/libflow"
license=('MIT')
depends=(glibc glib2 gtk4)
makedepends=(git meson vala gobject-introspection)
source=("https://github.com/SpikedPaladin/libflow/archive/$_pkgver.tar.gz")
sha256sums=('af7b20467e400844806b8267d56d9c34619d9135e65d1e56e5d0ea464178210e')

prepare() {
    cd "$_pkgname-$_pkgver"
}

build() {
    cd "$_pkgname-$_pkgver"
    arch-meson build
    ninja -C build
}

package() {
    cd "$_pkgname-$_pkgver"
    DESTDIR="${pkgdir}" ninja -C build install
}
