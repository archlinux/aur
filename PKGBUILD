# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

pkgname=python-esbonio
_pkgname=esbonio
pkgver=0.11.1
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
source=("https://files.pythonhosted.org/packages/49/79/1d19be7c08399f003c4a797697e080b4cc91eadb4b27a75ea43258f0460f/esbonio-0.11.1.tar.gz")
sha256sums=('e18e5f90b944a850e90a75a60841ff628a5746eb9664e8676e17f87bafd94c34')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
