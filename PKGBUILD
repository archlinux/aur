# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=beetcamp
pkgdesc='Plugin for beets to use Bandcamp as an autotagger source'
pkgver=0.16.3
pkgrel=3
url=https://github.com/snejus/beetcamp
arch=(any)
license=(GPL2)
depends=(beets python-pycountry python-requests)
makedepends=(python-build python-poetry)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('ee427bed4d8b12fc0b447de2f85861258e8def8dcc97fbfafc507bed22afa2de2d404fba2f4ac221f6a6ddcc449c26fb8d0675faebf486dc708d31317d811415')

build () {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package () {
	cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
