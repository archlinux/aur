# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=gabbi
pkgname=python-$_pyname
pkgver=2.3.0
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
md5sums=('3757163c26dcf2ce59957d999f8f3854')
sha256sums=('8766253b74e65e1a10317b7f3a3f1b7543be0962a714b0f9af9fb17020c385bd')
sha512sums=('e383b90c8e3e647a2490a654227d241e04b68c6a7cd883f50c8f39ca44954676e4bf4e371f7273246c9c02df52a18d65760fe7b1d8e290fab694bf755573f82b')

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
