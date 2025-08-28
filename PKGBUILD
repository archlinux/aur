# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=python-midiutil
_reponame=MIDIUtil
pkgver=1.2.1
pkgrel=5
pkgdesc="Library to work with MIDI files"
url="https://github.com/MarkCWirt/MIDIUtil"
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-installer' 'python-build')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MarkCWirt/MIDIUtil/archive/${pkgver}.tar.gz")
sha256sums=('d56057d00b88b7a45c34351b3313fb5d3892aff5f3fb89731ce5b8d23b8689ce')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m build
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
