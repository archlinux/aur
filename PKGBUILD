# Maintainer: TheFeelTrain <the@feeltra.in> 

pkgname=vsview-audio-convert
_origpkgname=vsview_audio_convert
pkgver=0.1.1
pkgrel=1
pkgdesc="A vsview plugin for converting audio sample types and resampling audio clips."
arch=("x86_64")
url='https://pypi.org/project/vsview-audio-convert/'
license=("MIT")
depends=(
    "vsview"
    "vapoursynth-plugin-audioresample"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
	"python-versioningit"
)
source=("https://files.pythonhosted.org/packages/74/a2/58b3deb5fddf2e21b25956d5bcd4130bc5a2aba62f060565a8e401bc816e/vsview_audio_convert-0.1.1.tar.gz")
sha256sums=("93d5fb5c9ff3e39b32ae7b6808ee3b67420291f4e910c093b9734356dfd43b59")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}