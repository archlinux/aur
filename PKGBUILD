# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=rhythmbox-plugin-alternative-toolbar
pkgver=0.20.2
pkgrel=1
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
_commit='6cac11564f31fdf00b367a7956f79e1a59682170'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd rhythmbox-plugin-alternative-toolbar
  ./configure --prefix=${pkgdir}/usr
  make
  make install
  rm ${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled
}
