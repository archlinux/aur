# Maintainer: Thomas Gläßle <aur@coldfix.de>

pkgname=git-punchcard
pkgver=2.0.3
pkgrel=1
pkgdesc="Show punchcard graphs with git commit activity."
arch=('any')
url="https://github.com/coldfix/git-punchcard"
license=('custom:UNLICENSE')
depends=('git' 'python-numpy' 'python-matplotlib' 'python-pytz')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d5905fe42a44c0c8756f6f00ece547c5')

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
