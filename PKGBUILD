# Maintainer: piernov <piernov@piernov.org

pkgname=csl-git
pkgver=r303.bc43df0
pkgrel=1
pkgdesc='Cube Server Lister'
arch=('i686' 'x86_64')
url='https://github.com/piernov/Cube-Server-Lister'
depends=('wxgtk')
makedepends=('git')
source=("csl-git::git+git://github.com/piernov/Cube-Server-Lister.git")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir/ install
}
