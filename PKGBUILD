# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.1.1
pkgrel=3
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.7.0' 'python<4.0.0' 'python-skyfield>=1.14' 'python-skyfield<2.0.0' 'python-numpy>=1.17.0' 'python-numpy<2.0.0')
makedepends=('python-setuptools')
arch=('any')
url='http://kosmorro.astronewbie.space'
license=('AGPL3')

source=("https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz")
sha256sums=("c2ade380968d285faa79f663fbd4721f914c612137614478364a17f4b5083674")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
