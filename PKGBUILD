# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-skyfield-data
pkgver=4.0.0
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
sha256sums=("5fc3d6b638bf8b786d49a70ee0ca94ce109c3e86a31586e9e1dd75bfe898a35e")

build() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    make package
}

package() {
    cd "${srcdir}/skyfield-data-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
