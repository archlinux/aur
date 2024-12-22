# Maintainer: Martin Rys <https://rys.rs/contact> | Toss a coin on https://rys.rs/donate
# Previous maintainer: Bijaya Dangol <dangoldbj23@gmail.com>

pkgname=python-hsaudiotag3k
_reponame=hsaudiotag3k
pkgver=1.1.3.post1
pkgrel=5
pkgdesc="Read metadata (tags) of mp3, mp4, wma, ogg, flac and aiff files (python3 version)"
url="https://pypi.org/project/hsaudiotag3k"
arch=('any')
# TODO(Martin): Fix license
license=('BSD')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('ef60e9210d4727e82f0095a686cb07b676d055918f0c59c5bfa8598da03e59d1')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
