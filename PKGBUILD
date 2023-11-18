# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-wekan
_reponame=python-wekan
pkgver=0.1.9
pkgrel=1
pkgdesc="Client for interacting with the WeKan® REST-API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('BSD')
depends=('python' 'python-dateutil' 'python-requests')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('ea3d37c3b9b73b9da5cf6795ab86ba13dfbae32ce2cd7b5616c8dfb941f01e7c')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
