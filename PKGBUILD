# Maintainer: Martin Rys <rys.pw/contact>

pkgname=python-elevenlabs
_reponame=elevenlabs
pkgver=1.0.0
pkgrel=1
pkgdesc="ElevenLabs API module - generate realistic, captivating speech in a wide range of languages"
url="https://pypi.org/project/elevenlabs/"
arch=(any)
license=('MIT')
depends=(
	'python'
	'python-httpx'
	'python-pydantic'
	'python-websockets'
)
makedepends=(
	'git'
	'python-poetry'
)
source=("https://pypi.org/packages/source/${_reponame::1}/${_reponame}/${_reponame}-$pkgver.tar.gz")
sha256sums=('29e47841b6e07b6a3bcaf6bda4ebd11387b507a2770f8a095e30144b11fa7244')

build() {
	cd "$srcdir/${_reponame}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${_reponame}-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
