# Maintainer: TheFeelTrain <the@feeltra.in>

pkgname=python-typed-ffmpeg-compatible3
_origpkgname=typed_ffmpeg_compatible
pkgver=3.11
pkgrel=1
pkgdesc="Modern Python FFmpeg wrappers offer comprehensive support for complex filters (Version 3)"
arch=("x86_64")
url='https://pypi.org/project/typed-ffmpeg-compatible/'
license=("MIT")
depends=("ffmpeg")
makedepends=(
    "python-build"
    "python-installer"
    "python-wheel"
    "python-setuptools"
    "python-setuptools-scm"
    "python-hatchling"
)
conflicts=("python-typed-ffmpeg-compatible")
provides=("python-typed-ffmpeg-compatible")
source=("https://files.pythonhosted.org/packages/source/t/${_origpkgname}/${_origpkgname}-${pkgver}.tar.gz")
sha256sums=('c7c9b82f35e1c2c6808161da6d4a922ca06a2c2ac01b0449b1f2727989ed109e')

package() {
    cd "${_origpkgname}-${pkgver}" || exit
    python -m build --wheel --no-isolation
    python -m installer --destdir="$pkgdir" dist/*.whl
}
