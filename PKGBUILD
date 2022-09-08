pkgbase="python-images-upload-cli"
pkgname=("python-images-upload-cli")
_module="images-upload-cli"
pkgver="1.0.6"
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
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f9cb4c91a5a2e137e3392fcf7860479f053d3a1850917e3fbdb425829b173d37')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
