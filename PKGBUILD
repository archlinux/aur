# Maintainer: Debucquoy Anthony (tonitch) <d.tonitch@gmail.com>

pkgname=python-asphalt
_name=${pkgname#python-}
pkgver=4.12.0
pkgrel=3
pkgdesc="Asphalt application framework (core)"
url="https://github.com/asphalt-framework/asphalt"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-ruamel-yaml' 'python-click' 'python-async_generator' 'python-asyncio_extras' 'python-async-timeout')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-setuptools-scm' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('21e2b323aba833ecd1ea84746b55d486de5027f119987528ddb7b20c0272d10e')

build() {
	cd "$_name-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_name-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
