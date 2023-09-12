# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=0.2.26
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
arch=(any)
license=('MIT')
depends=('python' 'python-pydantic>=2.3.0' 'python-requests' 'python-websockets>=11.0.3')
makedepends=('python-setuptools' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('1bb4f1074ac8b1c2a7d440dcb43dd122c0f183381901ecbcbccfe7e165c0a3aa')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
