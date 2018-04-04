# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='notejot'
pkgver='1.3.9'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('granite' 'gtk3' 'gtksourceview3' 'json-glib' 'libgee')
makedepends=('meson')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('5b8fa13de5074c40cc7ff0a10bed94b7')

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


