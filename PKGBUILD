# Maintainer: grufo <madmurphy333@gmail.com>

pkgname='notejot'
pkgver='1.4.3'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('granite' 'gtk3' 'gtksourceview3' 'json-glib' 'libgee')
makedepends=('meson')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('de4c61018ffcbf603ba0342e4c445ecf37b92b8bc5e80d3e5f2c28dd85adaf47')

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


