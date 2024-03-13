# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-bounded-pool-executor
_name=bounded_pool_executor
pkgver=0.0.3
pkgrel=1
pkgdesc="Bounded Process&Thread Pool Executor"
arch=('any')
url='https://github.com/mowshon/bounded_pool_executor'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/mowshon/bounded_pool_executor/master/LICENSE")
sha256sums=('e092221bc38ade555e1064831f9ed800580fa34a4b6d8e9dd3cd961549627f6e'
	'3fb94f992f1e1a2bf74952b7fafe515c1520fd13696788b1f1d004a573740d15')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "${_name}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
