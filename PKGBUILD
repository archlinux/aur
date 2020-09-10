# Maintainer: Akritas Akritidis <akritasak@gmail.com>
pkgname=execfs
pkgver=1.1.0
pkgrel=1
pkgdesc="The superior FUSE filesystem for exec on file open"
arch=('any')
url="http://github.com/MaanooAk/execfs"
license=('MIT')
depends=('python' 'python-fusepy')
makedepends=('git' 'python-setuptools')
provides=(execfs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/MaanooAk/execfs/archive/v$pkgver.tar.gz")
sha1sums=('e8fb41c72cbd667fc4eaabaae374994dac7d8054')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

