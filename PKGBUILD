# Maintainer: fspy <felipe@fspy.net>

pkgname=mktorrent-git
pkgver=r69.886c3d1
pkgrel=2
pkgdesc="A simple command line utility to create BitTorrent metainfo files"
arch=('i686' 'x86_64')
url="https://github.com/Rudde/mktorrent"
license=('GPL')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
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
	make DESTDIR="$pkgdir/" install
}
