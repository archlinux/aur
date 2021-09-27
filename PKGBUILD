# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.8.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('caff752de4648cbf5317bbd8ebe3c60f6e744d1287a9c486a372cf64e4d25050')

package() {
	install -D -m644 $srcdir/$upstream_name-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd $srcdir/$upstream_name-$pkgver
	python setup.py install --optimize=1 --root=$pkgdir
}
