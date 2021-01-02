# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-userspacefs
_name=${pkgname#python-}
pkgver=2.0.3
pkgrel=1
pkgdesc="Cross-platform user-space file systems for Python"
arch=('any')
url="https://github.com/rianhunter/userspacefs"
license=('GPL3')
depends=('python-fusepyng')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"{,.asc})
sha256sums=('ce2b62f73c771c5b835840d0ab965eb26f15899c7453d5d43072d02a8c53daec'
            'SKIP')
validpgpkeys=('584EDA5AAC13B9FBFB13F678A6A5398DACC9C15C') # Rian Hunter <rian@thelig.ht>

build() {
	cd "$_name-$pkgver"
    python setup.py build
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
