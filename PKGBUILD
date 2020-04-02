# Maintainer: Stick <stick@stma.is>
# Contributer: Sherlock Holo <Sherlockya@gmail.com>

pkgname=python-geventhttpclient-wheels
_name=${pkgname#python-}
pkgver=1.3.1.dev2
pkgrel=1
pkgdesc="Pre-built wheels for geventhttpclient"
arch=('any')
url='https://locust.io/'
license=('MIT')
depends=(
	'python-gevent'
	'python-certifi'
	'python-six'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('bd1f984ab5a52e3d6f5d54fd407a41e889dd4499f5991d234ebdc1f8907e2fb3')
provides=("$pkgname")
conflicts=("$pkgname")

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
