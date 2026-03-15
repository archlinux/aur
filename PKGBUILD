# Maintainer: TheFeelTrain <the@feeltra.in> 

pkgname=vsview-audio-convert
_origpkgname=vsview_audio_convert
pkgver=0.1.2
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
source=("https://files.pythonhosted.org/packages/44/4f/674549be01d1a4e5d64e52e7e35cbfc0cd98e2e752ef8422d9365fb4e57a/vsview_audio_convert-0.1.2.tar.gz")
sha256sums=("b7af37c871ffb6b78ede19833efc40c5d8dadefb5123223ba5654b9a3efc981c")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}