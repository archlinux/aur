# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-helpscout-v2
_reponame=python-helpscout-v2
pkgver=2.0.0
pkgrel=1
pkgdesc="Client for interacting with Help Scout's API"
url="https://pypi.org/project/${_reponame}/"
arch=(any)
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('a41fbb4569ebfdf246c08012c53b3e0162d5d22955b93d455310b436de08cb4d')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
