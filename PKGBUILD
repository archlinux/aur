# Maintainer: Bruno Santos <brunomanuelsantos@tecnico.ulisboa.pt>

upstream_name=hawkmoth
pkgname=python-sphinx-hawkmoth
pkgver=0.7.0
pkgrel=1
pkgdesc='Sphinx autodoc C extension'
arch=('i686' 'x86_64')
url='https://github.com/jnikula/hawkmoth'
license=('BSD2')
depends=('python-sphinx' 'clang')
source=('https://github.com/jnikula/hawkmoth/archive/v'$pkgver'.tar.gz')
sha256sums=('8441fa63be81a296670add71c485b5692464af83eb0339210b9a6a1b139fd298')

package() {
	install -D -m644 $srcdir/$upstream_name-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd $srcdir/$upstream_name-$pkgver
	python setup.py install --optimize=1 --root=$pkgdir
}
