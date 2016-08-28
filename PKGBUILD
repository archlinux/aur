# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgname=withtool-git
pkgver='54.ac47be6'
url="https://github.com/kalterfive/with"
pkgrel=1
pkgdesc='Program prefixing for continuous workflow using a single tool'
arch=(any)
license=('GPL3')
depends=(bash ncurses)
source=("withtool::git://github.com/kalterfive/with")
md5sums=('SKIP')

conflicts=('withtool')
provides=('withtool')

function pkgver() {
	cd 'withtool'
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

function package() {
	cd 'withtool'
	DESTDIR="$pkgdir" ./install.sh
}

