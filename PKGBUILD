# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-pytest-repeat
pkgver=0.7.0
pkgrel=1
pkgdesc="pytest-repeat is a plugin for py.test that makes it easy to repeat a single test, or multiple tests, a specific number of times."
arch=(any)
url="https://pypi.org/project/pytest-repeat"
license=('BSD')
depends=('python-six' 'python-attrs' 'python-atomicwrites' 'python-pluggy' 'python-more-itertools' 'python-pytest')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a2/87/992d24e12645abdb1dc20cad27d062285ba70b2d315defef518ee4912486/pytest-repeat-$pkgver.tar.gz")
sha256sums=('637e68dd615e850b47b2dee0edf72bcede44de6a5335837fe2980daaf0cdab2b')

package() {
    cd ${srcdir}/pytest-repeat-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
