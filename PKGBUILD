# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>

pkgname=fackup
pkgver=0.2.2
pkgrel=1
pkgdesc="File backup tool using rsync and dar."
arch=('i686' 'x86_64')
url="https://github.com/b3niup/fackup"
license=('MIT')
depends=('dar' 'rsync' 'python-yaml')
makedepends=(python-build python-installer python-wheel)
install="${pkgname}.install"
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f08b6067c0af49515081807a02ff2dfc')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
