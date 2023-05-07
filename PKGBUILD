pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_module="images_upload_cli"
pkgver="1.1.2"
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
makedepends=("python-setuptools")
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('5fc8109da7dbf6c0f6226b03f06e090a927266f31a672c11ced9dab3dd22f263')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
