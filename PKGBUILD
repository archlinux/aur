# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=gabbi
pkgname=python-$_pyname
pkgver=2.4.0
pkgrel=1
pkgdesc="Declarative HTTP testing library"
arch=(any)
url="https://github.com/cdent/gabbi"
license=(Apache)
depends=(
	python
	python-pbr
	python-pytest
	python-six
	python-pyaml
	python-urllib3
	python-certifi
	python-jsonpath-rw-ext
	python-wsgi-intercept
	python-colorama
)
makedepends=(python-setuptools)
checkdepends=(
	python-mock
	python-stestr
	python-coverage
	python-pytest-cov
	python-hacking
	python-sphinx
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('5171ff784c078816961b44fb5c0a36be')
sha256sums=('45b521f85bf2fc0194816978bc59a605cde57f34bf251a71b64ff175e4d69f8a')
sha512sums=('0485ac87f223f9ae95bb9a73cdc7e95ad49d8471f9e19625596e720ecc4dac358411dc9415409944855fa363db255479e5a623893063cc0967a3207321623306')

export PBR_VERSION=$pkgver

build(){
	cd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
