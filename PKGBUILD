# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=dasom-git
_pkgname=dasom
pkgver=240.eeb0df3
pkgrel=1
pkgdesc="Dasom is an input method framework"
arch=('any')
url="https://github.com/cogniti/${_pkgname}"
license=('GNU LGPL v3')
depends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'libhangul' 'xorg-server-utils' 'glib2')
makedepends=('gtk2' 'gtk3' 'qt4' 'qt5-base' 'libhangul' 'intltool' 'gobject-introspection' 'glib2' 'libappindicator-gtk3' 'git')
optdepends=('dconf-editor: For Editing Dasom IM Config')
conflicts=("dasom")
source=("${_pkgname}"::"git+https://github.com/cogniti/${_pkgname}.git")
md5sums=('SKIP')
options=(!buildflags)
install=$pkgname.install

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./autogen.sh
	make
}
package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}/" install
}


