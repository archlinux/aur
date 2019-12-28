# Maintainer: Jérôme Deuchnord <jerome@deuchnord.fr>

pkgname=kosmorro
pkgver=0.4.0
pkgrel=1
pkgdesc='A program that computes the ephemerides'
depends=('python>=3.5.0' 'python<4.0.0' 'python-skyfield>=1.14' 'python-skyfield<2.0.0' 'python-numpy>=1.17.0' 'python-numpy<2.0.0' 'python-tabulate')
makedepends=('python-setuptools')
arch=('any')
url='http://kosmorro.space'
license=('AGPL3')

source=("https://github.com/Deuchnord/kosmorro/archive/v${pkgver}.tar.gz")
sha256sums=("594b873553c067cab6538262d7b9e46b20842a9eedd530116a60734e3f681beb")

build() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/kosmorro-${pkgver}"
    python3 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
