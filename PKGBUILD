# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.8.0
pkgrel=2
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
makedepends=('python-build' 'python-install' 'python-wheel')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('caff752de4648cbf5317bbd8ebe3c60f6e744d1287a9c486a372cf64e4d25050')

build() {
	cd $srcdir/$upstream_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$upstream_name-$pkgver
	python -m install --optimize=1 --destdir="$pkgdir" dist/*.whl
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
