# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname='python-pyperf'
pkgver=1.7.1
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/vstinner/pyperf'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools' 'python-six')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vstinner/pyperf/archive/${pkgver}.tar.gz)
sha256sums=('151b6c3950d2fb3f161aa79997f7dec0e967b00e435530373c3e7ece240e0bfd')

build() {
    cd pyperf-${pkgver}
    python setup.py build
}

package() {
    cd pyperf-${pkgver}
    python setup.py install --prefix=/usr --root="${pkgdir}" -O1 --skip-build
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
