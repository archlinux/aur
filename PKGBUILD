# Maintainer: Popolon <popolon@popolon.org>

pkgname=python-kconfiglib
_name=kconfiglib
_dir=Kconfiglib
pkgver=14.1.0
pkgrel=2
pkgdesc="A flexible Python Kconfig implementation"
arch=('any')
url="https://pypi.org/project/kconfiglib/"
license=('ISC')
makedepends=('python-setuptools')
source=("https://github.com/ulfalizer/${_name}/archive/v${pkgver}.tar.gz")
sha512sums=('929a75f9b9f74ad7d4190c15d7178b94ee0a6d1fb71d85e2942935e3a9370a4f2483d8b49123d41d6610841ad9efde1dc4c14fc5231a08379d438a486ed3f97c')

build() {
    cd "${srcdir}/${_dir}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_dir}-${pkgver}"
    python setup.py install --skip-build  --root="${pkgdir}" --optimize=1
}
