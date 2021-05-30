# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=python-kosmorrolib
pkgver=0.11.2
pkgrel=1
pkgdesc='A library to compute the ephemerides'

depends=('python>=3.7.0' 'python<4.0.0'
         'python-skyfield>=1.21' 'python-skyfield<2.0'
         'python-numpy>=1.17.0' 'python-numpy<2.0.0'
         'python-dateutil>=2.8.0' 'python-dateutil<3.0.0'
        )

makedepends=('python-pip'
             'python-setuptools'
             'python-wheel'
            )

conflicts=('kosmorro<0.10.0')

arch=('any')
url='https://kosmorro.space/lib'
license=('CeCILL-C')

source=("$pkgname-v$pkgver.tar.gz::https://github.com/Kosmorro/lib/archive/v${pkgver}.tar.gz")
sha256sums=("ed85e10c8badf9e980ad5e909c9008460da88d0cd4f6a62b5230313d1e9926bb")

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
