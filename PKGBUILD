# Maintainer: Konstantin Ivanov <kostyarin.ivanov@gmail.com>

pkgname=('volantes-cursors')
commit_hash=59fe00e60ce1cd6d20bbe29a9cfe5c2b08bf25e6
pkgver=20200202.0
pkgrel=1
pkgdesc="Cursors theme"
arch=('any')
makedepends=(
	'bash'
	'inkscape'
	'xorg-xcursorgen'
)
url="https://github.com/varlesh/volantes-cursors"
license=('GPL2')
source=("https://github.com/varlesh/volantes-cursors/archive/$commit_hash.tar.gz")
sha256sums=('511a561124d62a7d461f65a6d9b8b01c167a027d504bcf11bdaa4b45fb2cea0a')

build() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make build
}

package() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make DESTDIR="$pkgdir/" install
}
