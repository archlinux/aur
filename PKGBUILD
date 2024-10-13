# Maintainer: Thomas Gläßle <aur@coldfix.de>

pkgname=git-punchcard
pkgver=2.0.4
pkgrel=2
pkgdesc="Show punchcard graphs with git commit activity."
arch=('any')
url="https://github.com/coldfix/git-punchcard"
license=('Unlicense')
depends=('git' 'python-numpy' 'python-matplotlib' 'python-pytz')
optdepends=('python-pyqt5: for immediate graph display')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c24855cf53140396e723883e95f5e9b9732f93fbbd38cd64e8bb2dc102d3da76')

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
