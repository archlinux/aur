# Maintainer: arielzn <arielzn@riseup.net>

pkgname=python-archspec
pkgver=0.1.2
pkgrel=1
pkgdesc="A library to query system architecture"
url="https://github.com/archspec/archspec"
depends=('python'
         'python-click>=7.1.2' 'python-click<8.0'
         'python-six>=1.13.0' 'python-six<2.0.0')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/archspec/archspec-$pkgver.tar.gz")
sha256sums=('8bb998370f0dc3e509d57c13724ab4109d761fd74af20da26fbe513b0fe01c46')

build() {
    cd "${srcdir}/archspec-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/archspec-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
