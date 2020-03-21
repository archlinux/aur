# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: j605

pkgname='python-pyperf'
pkgver=2.0.0
pkgrel=1
pkgdesc='Toolkit to run Python benchmarks'
url='https://github.com/vstinner/pyperf'
arch=('any')
license=('MIT')
depends=('python' 'python-setuptools' 'python-six')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vstinner/pyperf/archive/${pkgver}.tar.gz)
sha256sums=('5212d0685246cd555fb72680601a42a741126684df779e3a93f9abf766c018d2')

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
