# Maintainer: Kyle Bronsdon <kyle at silksow dot com>
# Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=linvstmanager-git
pkgver=1.1.1
pkgrel=2
pkgdesc="Graphical companion application for various bridges like LinVst, etc."
arch=('x86_64')
url="https://github.com/Goli4thus/linvstmanager"
license=('GPL')
groups=('pro-audio')
depends=('wine' 'git')
makedepends=('cmake' 'qt5-base')
conflicts=('linvstmanager')
optdepends=('jack' 'linvst-bin' 'linvst3-bin' 'linvst-x-bin' 'linvst3-x-bin')
source=("https://github.com/Goli4thus/linvstmanager/archive/refs/tags/v$pkgver.zip")
md5sums=('36d9540486a95d92b23dd5d6e8ededa7')

build() {
	cd "$srcdir/linvstmanager-$pkgver"

	mkdir build && cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/linvstmanager-$pkgver/build"
	make DESTDIR=${pkgdir} install
}
