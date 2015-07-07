# Maintainer: Foppe Hemminga <foppe@hemminga.net>
pkgname=flickrms
pkgver=1.0
pkgrel=1
pkgdesc="Management of ones flickr photos and photosets directly from a POSIX compliant machine"
arch=('i686' 'x86_64')
url="https://github.com/patrickjennings/FlickrMS"
license=("Apache")
#makedepends=()
depends=('fuse' 'flickcurl' 'pkg-config' 'libxml2' 'glib' 'curl')
source=("${pkgname%-*}::git+https://github.com/patrickjennings/FlickrMS")
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${pkgname%-*}"
	git describe --tags | sed 's|^v||'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin/"
	cd "${srcdir}/${pkgname%-*}/src/"
	cp flickrms "${pkgdir}/usr/bin/"
}