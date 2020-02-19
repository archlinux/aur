# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave
pkgname=python-pycaption
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils' 'python-future' 'python-six')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('1000447d92903c2044838f899578c6b8a2e853e9bef4a179b48415e367ea5038')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
