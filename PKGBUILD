# Maintainer: Akritas Akritidis <akritasak@gmail.com>
pkgname=execfs
pkgver=1.0.0
pkgrel=1
pkgdesc="The superior FUSE filesystem for exec on file open"
arch=('any')
url="http://github.com/MaanooAk/execfs"
license=('MIT')
depends=('python' 'python-fusepy')
makedepends=('git' 'python-setuptools')
provides=(execfs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaanooAk/execfs/archive/v$pkgver.tar.gz")
sha1sums=('c9b215902e4135a7cfc3a7e82835ad5fdce9ff75')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

