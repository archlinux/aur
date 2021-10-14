# Maintainer: fspy <felipe@fspy.net>
# Maintainer: Andy Bao <contact at andybao dot me>

pkgname=mktorrent-git
pkgver=r121.de7d011
pkgrel=1
pkgdesc="A simple command line utility to create BitTorrent metainfo files"
arch=('i686' 'x86_64' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/Rudde/mktorrent"
license=('GPL')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Rudde/mktorrent.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
