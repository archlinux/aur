# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Maarten van Gompel <proycon at anaproy dot nl>
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Dieter_be

pkgname=python-gensim
_pkgname=gensim
pkgver=3.8.1
pkgrel=1
pkgdesc="Library for topic modelling, document indexing and similarity retrieval with large corpora"
arch=('i686' 'x86_64')
license=('LGPL2.1')
url="https://radimrehurek.com/gensim/"
depends=('python-numpy' 'python-scipy' 'python-six' 'python-smart_open')
optdepends=("python-pyro: Usage in a distributed environment")
makedepends=('python-setuptools' 'cython')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RaRe-Technologies/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7c404cdf66d996a6083cdc9f474dc8deb6e99ef6710743e7faf9ddc8523fcd1abfa4c7f76cb376d8aae581202e13e8eaffedf98a0fad1f9318b8c3bbb63fd279')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py clean
	rm -rf build dist
	python setup.py build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
