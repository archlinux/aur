# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
pkgname=git-crecord
pkgver=20230226.0
pkgrel=1
pkgdesc="Git subcommand to interactively select changes to commit or stage"
arch=('any')
url="https://github.com/andrewshadura/git-crecord"
license=('GPL')
depends=('python')
makedepends=('python-docutils' 'python-setuptools')
source=("https://github.com/andrewshadura/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9bdf5d197fcdd753010d1f0f6fd465faa1f4805587528e4d3cefc4038b9132c9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./setup.py build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	./setup.py test
}


package() {
	depends+=('git')

	cd "$srcdir/$pkgname-$pkgver"
	./setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
