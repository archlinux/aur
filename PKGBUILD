# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-skyfield-data
pkgver=6.0.0
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
sha256sums=("9d02a13e8819263fbd513039f9696e3138bb6744803cf60f200f54c3667abd43")

build() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    make package
}

package() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
