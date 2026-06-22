# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=vsview-nativeres
_origpkgname=vsview_nativeres
pkgver=0.3.0
pkgrel=2
pkgdesc="A vsview plugin for analyzing and determining the native resolution of video content"
arch=("x86_64")
url='https://pypi.org/project/vsview-nativeres/'
license=("MIT")
depends=(
    "vsview"
    "python-nativeres"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-hatchling"
    "python-versioningit"
    "python-hatch-sbom"
)
source=("https://files.pythonhosted.org/packages/source/v/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('SKIP')
package() {
    cd "${_origpkgname}-${pkgver}" || exit
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
