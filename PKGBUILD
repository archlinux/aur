# Maintainer: goll <adrian.goll+aur[at]gmail>

pkgname=nocache-git
pkgver=109.86a9005
pkgrel=1
pkgdesc="minimize caching effects"
arch=('i686' 'x86_64')
url="https://github.com/Feh/nocache"
license=('FreeBSD License')
makedepends=('git' 'gcc' 'make')
conflicts=('nocache')
source=("$pkgname"::'git://github.com/Feh/nocache.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make
}

package() {
	cd "${srcdir}/${pkgname}"
        make DESTDIR="${pkgdir}" install PREFIX=/usr
}
