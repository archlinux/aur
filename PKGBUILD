# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>

_pkgname=PuLP
pkgname=python-pulp
pkgver=2.7.0
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=('python-amply')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
b2sums=('ae41e5daacad7401761ef6cbc7669b36d04552d5bbf3da31cee7c27db3382eb724b243f9428d59588977e4800d1fc008274e55d95d07d13ed35b6980c6b6cc12')

prepare() {
	rm -fr python-pulp
	cp -r $_pkgname-$pkgver python-pulp
}

build() {
	cd python-pulp
	python setup.py build
}

package() {
	cd python-pulp

	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build

	install --directory "$pkgdir"/usr/share/licenses/$pkgname/
	install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/
}
