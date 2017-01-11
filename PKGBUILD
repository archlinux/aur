# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgbase=python-py-bcrypt
pkgname=(${pkgbase})
pkgver=0.4
pkgrel=1
pkgdesc='bcrypt password hashing and key derivation'
license=('BSD')
arch=('i686' 'x86_64')
url='https://code.google.com/archive/p/py-bcrypt/'
makedepends=('python-setuptools') # 'python2-setuptools'
source=("https://pypi.python.org/packages/68/b1/1c3068c5c4d2e35c48b38dcc865301ebfdf45f54507086ac65ced1fd3b3d/py-bcrypt-0.4.tar.gz")
md5sums=('dd8b367d6b716a2ea2e72392525f4e36')

#prepare() {
#	cp -a "py-bcrypt-${pkgver}"{,-python2}
#}

build() {
	cd "${srcdir}/py-bcrypt-${pkgver}"
	python setup.py build

#	cd "${srcdir}/py-bcrypt-${pkgver}-python2"
#	python2 setup.py build
}

package_python-py-bcrypt() {
	depends=('python')

	cd "py-bcrypt-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

	install -Dm644 LICENSE \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#package_python2-py-bcrypt() {
#	depends=('python2')
#
#	cd "py-bcrypt-${pkgver}-python2"
#	python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
#
#	install -Dm644 LICENSE \
#		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#}
