# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: BlueSpirit < me AT phre4k DOT at > 

pkgname=firectl
pkgver=1.1.0
pkgrel=2
pkgdesc="Modifies .desktop files for firejail."
url="https://github.com/rahiel/firectl"
depends=('python-click' 'firejail')
makedepends=('python-setuptools')
license=('GPL2')
arch=('any')
source=("https://github.com/rahiel/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('71ffa6f4b0f90d5440ebda9c67894bf4')

build() {
    cd "${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
