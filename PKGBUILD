# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=0.2.27
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
arch=(any)
license=('MIT')
depends=('python' 'python-pydantic>=2.3.0' 'python-requests' 'python-websockets>=11.0.3')
makedepends=('python-setuptools' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('1b17d3c997557e5aa654b296e3960c25ea183525cfdbd0ec53070b038ba5fd95')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
