# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=0.2.24
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
arch=(any)
license=('MIT')
depends=('python' 'python-pydantic' 'python-requests' 'python-websockets')
makedepends=('python-setuptools' 'git')
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('7719816f8d74666c0da5567e737b6c0200f2807bed9d9c21ed750f14e8a3669d')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python setup.py install --root="$pkgdir"
}
