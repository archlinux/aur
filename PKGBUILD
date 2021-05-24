# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Contributor: PedroHLC <root AT pedrohlc DOT com>

pkgname='notejot'
pkgver='3.0.4'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('gtk3' 'gtksourceview3' 'json-glib' 'libgee' 'libadwaita')
makedepends=('meson' 'vala')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c3aefcd1ebd5eeac2da37dc3954ddd867b6f665df45e499f33cf208ea14aea7e')

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


