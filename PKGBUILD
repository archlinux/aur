# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.2.3
pkgrel=1
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.7.0' 'python<4.0.0' 'python-skyfield>=1.14' 'python-skyfield<2.0.0' 'python-numpy>=1.17.0' 'python-numpy<2.0.0' 'python-tabulate')
makedepends=('python-setuptools')
arch=('any')
url='http://kosmorro.astronewbie.space'
license=('AGPL3')

source=("https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz")
sha256sums=("52564f854f686004e6b88954601ed00d3e66540e96155d7020d2fa23760ab7fc")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
