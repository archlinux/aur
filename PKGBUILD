# Maintainer: Jakob Pfender <jakob dot pfender at gmail dot com>

pkgname=python-network2tikz-git
epoch=
pkgver=0.1.8.r0.gd8a4daa
pkgrel=1
pkgdesc='A converter that takes a network (cnet, igraph, networkx, pathpy, ...) and creates a tikz-network for smooth integration into LaTeX.'
arch=(any)
url=https://github.com/hackl/network2tikz
license=(GPL3)
depends=(python python-numpy)
makedepends=(git)

checkdepends=()
provides=(python-network2tikz)
conflicts=(${provides%=*})
source=('git+https://github.com/hackl/network2tikz#tag=v0.1.8')
md5sums=(SKIP)
noextract=()

pkgver() {
	cd "$srcdir/network2tikz"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/network2tikz"
	python setup.py build
}

package() {
	cd "$srcdir/network2tikz"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
