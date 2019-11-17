# Maintainer: Alan Bunbury
pkgname=flying-robots
pkgver=0.2.0
pkgrel=1
pkgdesc="A three-dimensional clone of the classic BSD Robots game."
arch=('any')
url="https://github.com/bunburya/FlyingRobots"
license=('MIT')
depends=('python')
optdepends=('tk: For tkinter-based UI')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("http://bunburya.eu/apps/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

md5sums=('ce38284174e6cf15c0ca710c15bce486')

# vim:set ts=2 sw=2 et:
