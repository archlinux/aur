# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=rhythmbox-plugin-alternative-toolbar
pkgver=0.20.4
pkgrel=2
pkgdesc='Modern, minimal and music-focused interface for Rhythmbox'
arch=('any')
url="https://github.com/fossfreedom/alternative-toolbar"
license=(GPL3)
depends=(
    libkeybinder3
    python-gobject
    python-lxml
    rhythmbox
)
makedepends=(
    git
    gettext
    intltool
)
conflicts=(
    rhythmbox-plugin-alternative-toolbar-git
)
install='rhythmbox-plugin-alternative-toolbar.install'
_commit='a03f1b3f36fb8802b9f4c9117ee1e302a8e2894d'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
    cd rhythmbox-plugin-alternative-toolbar
    ./autogen.sh --prefix=${pkgdir}/usr
    make
    make install
    rm ${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled
}
