# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-wekan
_reponame=python-wekan
pkgver=0.1.5
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('38d4b9fe5387b689b6ce75d5f6e778376f98aca1817d2b7c5bd521736f2f9a15')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
