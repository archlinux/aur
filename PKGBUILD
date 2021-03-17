# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=gabbi
pkgname=python-$_pyname
pkgver=2.2.0
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
md5sums=('a07d2575ba0bd3b52dbb358e3985546c')
sha256sums=('a78bc2abe086951616d4edb630e8725d8418a70b33100e9d67571a50a80fffcb')
sha512sums=('f0b3b9f1d4adb587aff6bfb3a83742daa3b82603458c0c7dd597d404aa0441b60e3612a14d34a7e32491e8550ef042bc754792c1d2c4379df0c411d93254e7e3')

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
