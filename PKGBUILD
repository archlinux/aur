# Maintainer: vantu5z <vantu5z@mail.ru>

pkgname=python-shell
pkgver=1.0.4
pkgrel=2
pkgdesc="Python Shell Wrapper Library. A better way to run shell commands in Python."
url="https://github.com/bart-tools/python-shell"
depends=('python' 'python-six')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/bart-tools/python-shell/archive/stable/$pkgver.tar.gz")
sha256sums=('a3e35889d44c0d3c8f52b07f0969560e985605e1f66161535e6ca548580d183c')

build() {
    cd "${srcdir}/${pkgname}-stable-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-stable-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
