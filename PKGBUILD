# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.11.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-install' 'python-wheel')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('91b6f035a9617ef18d759b1a03ff084831f451ccab4b9c815f5f4ae397d9557a')

build() {
	cd $srcdir/$upstream_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$upstream_name-$pkgver
	python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
