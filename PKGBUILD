# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgbase=python-py-bcrypt
pkgname=($pkgbase)
pkgver=0.4
pkgrel=1
pkgdesc='bcrypt password hashing and key derivation'
license=('BSD')
arch=('i686' 'x86_64')
url='https://pypi.python.org/pypi/py-bcrypt/'
makedepends=('python-setuptools') # 'python2-setuptools'
source=("https://pypi.python.org/packages/source/p/py-bcrypt/py-bcrypt-${pkgver}.tar.gz")
md5sums=('dd8b367d6b716a2ea2e72392525f4e36')

#prepare() {
#	cp -a "py-bcrypt-$pkgver"{,-python2}
#}

build() {
	cd "$srcdir/py-bcrypt-$pkgver"
	python setup.py build

#	cd "$srcdir/py-bcrypt-$pkgver-python2"
#	python2 setup.py build
}

package_python-py-bcrypt() {
	depends=('python')

	cd "py-bcrypt-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

#package_python2-py-bcrypt() {
#	depends=('python2')
#
#	cd "py-bcrypt-$pkgver-python2"
#	python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
#
#	install -Dm644 LICENSE \
#		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#}

# vim: set ts=4 sw=4 tw=0 ft=sh :
