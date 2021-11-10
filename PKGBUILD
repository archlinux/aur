
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=python-scienceplots
_name='SciencePlots'
pkgver=1.0.9
pkgrel=1
pkgdesc='Matplotlib styles for scientific plotting.'
arch=('any')
url='https://github.com/garrettj403/SciencePlots'
license=('MIT')
depends=('python' 'python-matplotlib')
makedepends=('python-setuptools')
conflicts=('python-scienceplots-git')
source=("$pkgname-$pkgver::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
