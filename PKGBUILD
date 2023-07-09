# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=0.2.18
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
arch=(any)
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cython' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('5ce6578fdda5cddba8432bbc572c92365d004786edf1b063f08a338916b825ae')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
