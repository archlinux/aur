# Maintainer: Thiago Perrotta <tbperrotta@gmail.com>
pkgname=git-crecord
pkgver=20201025.0
pkgrel=1
pkgdesc="Git subcommand to interactively select changes to commit or stage"
arch=('any')
url="https://github.com/andrewshadura/git-crecord"
license=('GPL')
depends=('python')
makedepends=('python-docutils' 'python-setuptools')
source=("https://github.com/andrewshadura/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('54a1ff68464302c8aff4278c0ad137b5b6e7ad10b7a4c12016e5dbc89cf93df7')

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
