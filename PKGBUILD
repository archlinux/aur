# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: Princeton Ferro <princetonferro AT gmail DOT com>
# Contributor: PedroHLC <root AT pedrohlc DOT com>

pkgname='notejot'
pkgver='3.1.5'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('gtk4' 'gtksourceview3' 'json-glib' 'libgee' 'libadwaita')
makedepends=('meson' 'vala')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('1538fe33a81d6bc350b45e39be60e2a0a783733b3af970f678df1530f7613bef')

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


