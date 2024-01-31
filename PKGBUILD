# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=rhythmbox-plugin-alternative-toolbar
pkgver=0.20.4
pkgrel=1
pkgdesc='Modern, minimal and music-focused interface for Rhythmbox'
arch=('any')
url="https://github.com/fossfreedom/alternative-toolbar"
license=('GPL3')
depends=(
    'libkeybinder3'
    'python-gobject'
    'python-lxml'
    'rhythmbox'
)
makedepends=(
    'git'
    'gettext'
    'intltool'
)
conflicts=(
    'rhythmbox-plugin-alternative-toolbar-git'
)
install='rhythmbox-plugin-alternative-toolbar.install'
_commit='269ae059f729afaa495c80fa2e352db76da5002e'
source=("${pkgname}::git+${url}#commit=${_commit}")
sha256sums=('SKIP')

package() {
  cd rhythmbox-plugin-alternative-toolbar
  ./autogen.sh --prefix=${pkgdir}/usr
  make
  make install
  rm ${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled
}
