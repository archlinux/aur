# Maintainer: Serkan Hosca <serkan@hosca.com>
_name=pyls-flake8
pkgname=python-pyls-flake8
pkgver=0.4.0
pkgrel=1
pkgdesc="A Flake8 plugin for the Python LSP Server."
arch=("any")
url="https://github.com/emanspeaks/pyls-flake8/"
license=("MIT")
makedepends=("python-setuptools")
depends=("python" "flake8")
source=("$pkgname-$pkgver.tar.gz::https://github.com/python-lsp/python-lsp-black/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('b743cab255bda5d6b11dc67094493550')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
