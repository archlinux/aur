# Maintainer: gaelic

pkgname=gtk-theme-adapta-git
_pkgname=Adapta
_pkgauthor=tista500
pkgver=1095.a4b9982
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on Material Design Guidelines - git master"
arch=('any')
url="https://github.com/tista500/${_pkgname}"
license=('GPLv2')
depends=('gtk2' 'gtk3' 'gdk-pixbuf2' 'gtk-engine-murrine')
makedepends=('git' 'inkscape' 'glib2' 'libxml2' 'ruby-bundler' 'ruby-sass')
source=(${_pkgname}::"git+https://github.com/tista500/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=('adapta-gtk-theme')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh --prefix=/usr --enable-chrome --enable-plank
}

package() {
  cd "${srcdir}/${_pkgname}"
  make
	make DESTDIR="${pkgdir}" install
}

