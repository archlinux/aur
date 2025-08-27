# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-skyfield-data
pkgver=7.0.0
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
sha256sums=("509c46a99e409cd1049e5c598d4971398ae8280b2a79b68296f699f92684e994")

build() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    make package
}

package() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
