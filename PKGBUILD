# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-skyfield-data
pkgver=5.0.0
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
sha256sums=("bbe8d7542338097debdcfa41492af9fe8b2255c1b0f03d8acbd0b94cfaf61017")

build() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    make package
}

package() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
