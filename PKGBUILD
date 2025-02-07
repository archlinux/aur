# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Peter Crighton <PeteCrighton@gmail.com>
# Maintainer: otaj < ota.jasek at proton dot me>

pkgname=python-hiyapyco
_name=HiYaPyCo
pkgver=0.7.0
pkgrel=1
pkgdesc="A Hierarchical Yaml Python Config"
arch=('any')
url="https://github.com/zerwes/hiyapyco"
license=('GPL3')
depends=('python-yaml' 'python-jinja' 'python-markupsafe')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('bbe5871eed38cc867646340bc3673c9aa24cfbd1759e294aad5a82ed0f31728541db798d02fc68754b8c956161ff965558da150af2d688b47aa0ef05d0096d1e')
b2sums=('c66c991fa8f9f05e1aeac401c0e642341d2fb67f8eeb45415759843bd0676071cee766294409936974172bf49b27d6503ba51fd5cfdaf981a5e80d4cbb577100')

build() {
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
