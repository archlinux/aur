# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-aiofile
_name=${pkgname#python-}
pkgver=3.5.1
pkgrel=1
pkgdesc="Real asynchronous file operations with asyncio support"
arch=('any')
url="https://github.com/mosquito/aiofile"
license=('Apache')
depends=('python-caio')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('7680bc9ef71cede0c73591d7870a227e6417845da322006e542762165329d1e0')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
