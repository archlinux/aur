# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=1.0.1
pkgrel=2
pkgdesc='A library to compute the ephemerides'

depends=('python'
         'python-skyfield>=1.21' 'python-skyfield<2.0'
         'python-skyfield-data>=3.0.0' 'python-skyfield-data<4.0.0'
         'python-numpy>=1.17.0' 'python-numpy<2.0.0'
         'python-dateutil>=2.8.0' 'python-dateutil<3.0.0'
        )

makedepends=('python-pip'
             'python-setuptools'
             'python-wheel'
            )

arch=('any')
url='https://kosmorro.space/lib'
license=('AGPL')

source=("$pkgname-v$pkgver.tar.gz::https://codeload.github.com/kosmorro/lib/tar.gz/refs/tags/v$pkgver")
sha256sums=("2644c78c3e4fab82a6b33034bda264941a9260f1d4438bcf38ac09e12df57e04")

build() {
    cd "${srcdir}/lib-${pkgver}"
    make build
}

test() {
    cd "${srcdir}/lib-${pkgver}"
    make test
}

package() {
    cd "${srcdir}/lib-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
