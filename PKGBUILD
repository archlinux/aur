# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Submitter: L <alaviss0@gmail.com>

pkgname=gnome-shell-theme-elegance-colors-git
_pkgname=elegance-colors
pkgver=238.ca44e2f
pkgrel=4
pkgdesc="A chameleon theme for Gnome Shell which can change colors according to the current GTK theme, current wallpaper (uses imagemagick to get color) or a user defined color."
arch=('i686' 'x86_64')
url="https://github.com/satya164/elegance-colors"
license=('GPL3')
depends=('gtk3' 'gnome-shell>=3.6' 'glib2' 'imagemagick')
makedepends=('vala')
conflicts=('gnome-shell-themes-elegance-colors')
provides=('gnome-shell-themes-elegance-colors')
install="${_pkgname}.install"
source=(${_pkgname}::'git+https://github.com/satya164/elegance-colors.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  make -C "${srcdir}/${_pkgname}"
}

package() {
  make -C "${srcdir}/${_pkgname}" DESTDIR="${pkgdir}" install
}
