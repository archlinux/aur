# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='notejot'
pkgver='1.4.5'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('granite' 'gtk3' 'gtksourceview3' 'json-glib' 'libgee')
makedepends=('meson')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('55f3d7757add549a6487683b651e33bee9df08c3d4022571bb0a6af4b395604c')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	meson build
	cd build
	meson configure -Dprefix=/usr

}

package() {

	cd "${srcdir}/${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install

}


