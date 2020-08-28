# Maintainer: Thomas Gläßle <aur@coldfix.de>

pkgname=steam-acolyte
pkgver=v0.6.2
pkgrel=1
pkgdesc="Lightweight user account switcher/login keeper for steam"
arch=('any')
url="https://github.com/coldfix/${pkgname}"
license=('custom:UNLICENSE')
depends=('python' 'python-pyqt5' 'python-vdf' 'python-docopt')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('168c75bf39bf18692a71cc866fba53b2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -D -m 0644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
    install -D -m 0644 "UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
