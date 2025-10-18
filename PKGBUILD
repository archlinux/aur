# Maintainer: TheFeelTrain <thefeeltrain@thefeeltrain.com>
pkgname=python-mkvinfo
_origpkgname=mkvinfo
pkgver=0.0.3
pkgrel=1
pkgdesc="Python library for probing matroska files with mkvmerge."
arch=("x86_64")
url='https://pypi.org/project/mkvinfo/'
license=("None")
depends=()
makedepends=(
	"python-build"
	"python-installer"
	"python-wheel"
	"python-setuptools"
	"python-hatchling"
)
source=("https://files.pythonhosted.org/packages/a0/06/bf3c250a733db9b2c6a6adb1936697b1adeb26b0dfadf3ab2a68d27f0d99/mkvinfo-0.0.3.tar.gz")
sha256sums=("d2e92864746ebe14eab5ff1a4d2d6046e6a93f6a0e1039d27da91515633acfa3")
package() {
	cd "${_origpkgname}-${pkgver}" || exit
	python -m build --wheel --no-isolation
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

