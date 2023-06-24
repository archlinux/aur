pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_module="images_upload_cli"
pkgver="2.0.0"
pkgrel=1
pkgdesc="Upload images via APIs"
url="https://github.com/DeadNews/images-upload-cli"
depends=(
    "python"
    "python-click"
    "python-dotenv"
    "python-httpx"
    "python-pillow"
    "python-pyperclip"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-poetry-core"
    "python-poetry-dynamic-versioning"
)
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('5ee6aa2dcfd68403c4915a8f48ab3e4ab2cd1d7948b9951ef81353a47d407f5e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
