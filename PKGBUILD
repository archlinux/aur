# Maintainer: Konstantin Ivanov <kostyarin.ivanov@gmail.com>

pkgname=('volantes-cursors')
commit_hash=f5dd936e213a7e960f5b39f06ff6b18b2145a0b5
pkgver=20200209.0
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
sha256sums=('bb4b213535ea212dc084c5e2d7ece9acd67c9a5d82eb074f4b365debcd9fe85d')

build() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make build
}

package() {
	cd "${srcdir}/$pkgname-$commit_hash"
	make DESTDIR="$pkgdir/" install
}
