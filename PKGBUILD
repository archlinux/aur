# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-frozendict
pkgname=(python2-frozendict)
pkgver=0.4
pkgrel=1
pkgdesc='An immutable dictionary'
license=('MIT')
arch=('any')
url='https://pypi.python.org/pypi/frozendict/'
makedepends=('python2-setuptools')
source=("https://pypi.python.org/packages/source/f/frozendict/frozendict-${pkgver}.tar.gz")
md5sums=('1a89e2f6c42997358dcaa6bbbeac0819')

build() {
	cd "frozendict-$pkgver"
	python2 setup.py build
}

package_python2-frozendict() {
	depends=('python2')

	cd "frozendict-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim: set ts=4 sw=4 tw=0 ft=sh :
