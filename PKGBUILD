# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=gummi-gtk3-git
_pkgname=gummi
pkgver=1341.3d91b69
pkgrel=1
pkgdesc="Gummi LaTeX Editor Gtk3 port git version"
arch=("x86_64" "i686")
url="https://github.com/aitjcize/Gummi"
license=("MIT")
makedepends=(git intltool)
conflicts=(gummi gummi-svn)
depends=(gtk3 poppler-glib gtkspell3 texlive-core gtksourceview3)
source=("git://github.com/aitjcize/${_pkgname}.git")
sha256sums=("SKIP")


pkgver() {
  cd "${_pkgname}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
