# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-skyfield-data
pkgver=3.0.0
pkgrel=1
pkgdesc='Minimal data files to work with python-skyfield'

depends=('python')

makedepends=('python-pip'
             'python-setuptools'
             'python-wheel'
            )

arch=('any')
url='https://github.com/brunobord/skyfield-data'
license=('MIT')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/brunobord/skyfield-data/tar.gz/refs/tags/$pkgver")
sha256sums=("99c9c307aa854a05108f28308f18848d69fe0e1e81beff5c886a00e9a6d651a5")

build() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    make package
}

package() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
