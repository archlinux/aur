# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-affinity
pkgname=(python2-affinity)
pkgver=0.1.0
pkgrel=1

pkgdesc='control processor affinity on windows and linux'
url='https://pypi.python.org/pypi/affinity'
arch=('any')
license=('PSFL')

makedepends=('python2-setuptools')

source=("https://pypi.python.org/packages/32/a7/69e207c17b4d7f23f7537f97c2938053e6ba24b6206d1856790d2eb8e4d8/affinity-0.1.0.tar.gz")

md5sums=('cc610cdb05ca675b4089ce2f05796f57')

prepare() {
	mv affinity-$pkgver{,-python2}
}

build() {
	cd "$srcdir"/affinity-$pkgver-python2
	python2 setup.py build
}

package_python2-affinity() {
	depends=('python2')

	cd affinity-$pkgver-python2
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
