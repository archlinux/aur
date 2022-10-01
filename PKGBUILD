# Maintainer: Konstantin Ivanov <kostyarin.ivanov@gmail.com>

pkgname=('volantes-cursors')
commit_hash=b13a4bbf6bd1d7e85fadf7f2ecc44acc198f8d01
pkgver=20220828.0
pkgrel=3
pkgdesc="Cursors theme"
arch=('any')
makedepends=(
	'bash'
	'inkscape'
	'xorg-xcursorgen'
	'libsoup'
)
url="https://github.com/varlesh/volantes-cursors"
license=('GPL2')
source=("https://github.com/varlesh/volantes-cursors/archive/$commit_hash.tar.gz")
sha256sums=('24a8b82fb99011032669c8721e11ddb05350b57baff7f2b3751853b6868acce1')

build() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make build
}

package() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make DESTDIR="$pkgdir/" install
}
