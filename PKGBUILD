# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=git-remote-hg
pkgver=0.6
pkgrel=1
pkgdesc='Bidirectional bridge between Git and Mercurial'
arch=('any')
url="https://github.com/felipec/$pkgname"
license=('GPL2')
depends=('git' 'mercurial')
makedepends=('asciidoctor')
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('8a1acaba6d5f2acd453870b136695eba')

build() {
	cd "$pkgname-$pkgver"
	make all doc
}

check() {
	cd "$pkgname-$pkgver"
	make test
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" make prefix=/usr install install-doc
}
