# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-wekan
_reponame=python-wekan
pkgver=0.1.8
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('8c76cbc7b4883653052a1ef75dfa667f5f8b569b59c67853c6bbe0e403aff627')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
