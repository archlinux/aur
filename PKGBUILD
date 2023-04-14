# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>
# Contributor: 

_gitname=feedback
_author=elementary
pkgname=elementary-${_gitname}
pkgver=7.0.0
pkgrel=1
pkgdesc="GitHub Issue Reporter for elementary team"
arch=('any')
url="https://github.com/${_author}/${_gitname}"
license=('GPL3')
groups=('pantheon-stable')
depends=('appstream' 'glib2' 'gtk4' 'libadwaita')
makedepends=('meson' 'granite7' 'vala' )
optdepends=('pantheon-default-settings')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=("ad6f309375e4fb44d05367b30da339bf791632c11066b954e5a13a08623973ef")

build() {
    cd "${_gitname}-${pkgver}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}-${pkgver}/"
    DESTDIR="${pkgdir}" ninja -C _build install
}

