# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate

pkgname=python-deezer-py
_reponame=deezer-py
pkgver=1.3.7
pkgrel=3
pkgdesc="A wrapper for all Deezer's APIs"
url="https://pypi.org/project/deezer-py/"
arch=('any')
license=('GPL-3.0-or-later')
depends=('python' 'python-requests')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('b1a332f88780cba1fd4a04bc5c79d9f649457ab1b2afebd0aa1b82b629a06c4a')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
