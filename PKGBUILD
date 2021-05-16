# Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributer: rilian-la-te <ria.freelander@gmail.com>

makedepends=('meson' 'glib2')

_pkgbase="vala-panel-appmenu"
pkgname="vala-panel-appmenu-registrar"
_path="subprojects/registrar"
pkgver=0.7.6
pkgrel=1
pkgdesc="Small utility to hold DBusMenu menus"
conflicts=("vala-panel-appmenu-registrar-git")
depends=('glib2')
url="https://gitlab.com/vala-panel-project/vala-panel-appmenu"
arch=('i686' 'x86_64')
license=('LGPL3')

source=("git+https://gitlab.com/vala-panel-project/${_pkgbase}.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    meson build "${srcdir}/${_pkgbase}/${_path}" --prefix=/usr --libexecdir=lib
    meson compile -C build
}

package() {
    DESTDIR="$pkgdir" meson install -C build --no-rebuild
}
