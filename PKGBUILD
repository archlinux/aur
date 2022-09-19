# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=gabbi
pkgname=python-$_pyname
pkgver=2.7.2
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
md5sums=('9820a39fc3afeb2d180511624a3ba558')
sha256sums=('eb13b028397aa26fda3f3b22f86e15f68eaa571ed8fee5ab8b1cf4cae3385ffa')
sha512sums=('8d18ff8486f466a98a6f0749b60368abac514ffe20775ff9f60dd00ec1d40eb588ca7f5d205b2a623bd1b3bc3cca73b18c8738e32c62d6027d312e799755b32b')

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
