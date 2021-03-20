# Maintainer: zhullyb <zhullyb@outlook.com>

_pyname=md2html
pkgname=python-$_pyname
pkgver=1.3.0
pkgrel=1
pkgdesc="MD to HTML converter"
arch=(any)
url="https://github.com/chrispyles/markdown-to-html"
license=(Apache)
depends=(
	python
)

makedepends=(
	python
)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('428cc90c18eb270a459d1293e6415ef7')

build(){
	pushd $_pyname-$pkgver
	python setup.py build
}

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
# 	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
} 
