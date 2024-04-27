# Contributor: Médéric Boquien <mboquien@free.fr>

pkgname=python-lime
pkgver=0.2.0.1
pkgrel=3
pkgdesc="Lime: Explaining the predictions of any machine learning classifier"
arch=('any')
url="https://github.com/marcotcr/lime"
license=("BSD 2-Clause")
depends=("python")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/f5/86/91a13127d83d793ecb50eb75e716f76e6eda809b6803c5a4ff462339789e/lime-${pkgver}.tar.gz")
sha512sums=('f72a91af7f0a9f2377e36a401724ffe09cd48f0c7d86385036fff1aa71686346547e03a690fe7896fcf97be0d23eb1a8d9db2c362ad10d6229bab808bd27c651')

build(){
    cd "lime-${pkgver}"
    python setup.py build
}

package(){
    cd "lime-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
    install -D LICENSE "${pkgdir}/usr/share/licenses/python-lime/LICENSE"
}
