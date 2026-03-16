# Maintainer: TheFeelTrain <the@feeltra.in> 

pkgname=vsview-audio-convert
_origpkgname=vsview_audio_convert
pkgver=0.1.3
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
source=("https://files.pythonhosted.org/packages/f4/6f/cb03371ef19392e776e5a09dbe6733be9be8f23ff730e1ce0a9bd1b24f6e/vsview_audio_convert-0.1.3.tar.gz")
sha256sums=("8727ffd90f328b4611604a1456fc26433a802d83025ac4727eb9c0770d202331")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}