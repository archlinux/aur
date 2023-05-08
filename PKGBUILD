pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_module="images_upload_cli"
pkgver="1.1.3"
pkgrel=1
pkgdesc="Upload images via APIs"
url="https://github.com/DeadNews/images-upload-cli"
depends=(
    "python"
    "python-click"
    "python-dotenv"
    "python-pillow"
    "python-pyperclip"
    "python-requests"
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
sha256sums=('e82506ef8812f9bfccdbe72c230919588050e100c663ad2bb1620a5551438885')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
