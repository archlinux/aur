# Maintainer: Konstantin Ivanov <kostyarin.ivanov@gmail.com>

pkgname=('volantes-cursors')
commit_hash=d1d290ff42cc4fa643716551bd0b02582b90fd2f
pkgver=20200506.0
pkgrel=2
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
sha256sums=('7eed19db07ee8f84949e9a7c94b8b0f71d160ee703a315bbd2fc65f3c3f969e6')

build() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make build
}

package() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make DESTDIR="$pkgdir/" install
}
