# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-userspacefs
_gitname=userspacefs
pkgver=1.0.13
pkgrel=3
pkgdesc="Cross-platform user-space file systems for Python"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rianhunter/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('3caf25cbfff1329887b5f0cef7ae478e7f01d1c0c94a6bc2af4fd6eaaead648a')

build() {
	cd "$_gitname-$pkgver"
    python setup.py build
}

package() {
	cd "$_gitname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
