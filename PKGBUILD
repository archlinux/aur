pkgbase='python-pre-commit-mirror-maker'
pkgname=('python-pre-commit-mirror-maker')
_module='pre-commit-mirror-maker'
pkgver='1.9.0'
pkgrel=1
pkgdesc="Scripts for creating mirror repositories that do not have .pre-commit-hooks.yaml"
url="https://github.com/pre-commit/pre-commit-mirror-maker"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module//-/_}-$pkgver.tar.gz")
sha256sums=('a5ae18e48a9d4ab3ceb7738a4c17e3ac572b7a9d24c7d80290fd517c61e9e59c')

build() {
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module//-/_}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
