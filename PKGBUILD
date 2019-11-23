# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-block_tracing
_gitname=block_tracing
pkgver=1.0.1
pkgrel=3
pkgdesc="Protect process memory"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/block_tracing"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
#source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/$_gitname/archive/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_gitname::1}/$_gitname/$_gitname-$pkgver.tar.gz")
sha256sums=('9faa009a702a8f2f605ebb78314d5ca2a2a93543d061038a3d3a978c93385e68')

build() {
	cd "$_gitname-$pkgver"
    python setup.py build
}

package() {
	cd "$_gitname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
