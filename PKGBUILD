# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=python-esbonio
_pkgname=esbonio
pkgver=0.14.0
pkgrel=1
pkgdesc="A language server for working with Sphinx projects."
arch=("any")
url="https://github.com/swyddfa/esbonio"
license=('MIT')
depends=("python-appdirs"
         "python-sphinx"
         "python-pygls"
         "python-pyspellchecker"
         "python-typing_extensions")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/df/0b/915a34c855b227e6444d5d954d190b998a52e2b27ea815db24bc0662afda/esbonio-0.14.0.tar.gz")
sha256sums=('9a76b4c6b8e5dd87d621728c7ac31657f1be350f20812081b6fffabb3fea2b08')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
