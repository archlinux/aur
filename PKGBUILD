# Maintainer: éclairevoyant
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>
# Contributor: Eugene Dvoretsky <radioxoma at gmail dot com>

_pkgname=gpxpy
pkgname="python-$_pkgname"
pkgver=1.5.0
pkgrel=2
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=(Apache)
depends=('python>=3.2' 'python-lxml>=3.1.2')
makedepends=(python-setuptools python-{build,installer,wheel})
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4fd0afe9f8858d340a1481a7ef05de0be498ce19c1e1535407b58b7f1f02d456')

build () {
	cd $_pkgname-$pkgver
	python -m build -wn
}

check() {
	cd $_pkgname-$pkgver
	python -m unittest test
}

package() {
	cd $_pkgname-$pkgver
	python -m installer -d "$pkgdir" dist/*.whl
}
