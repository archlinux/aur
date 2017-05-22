# Maintainer: Gregoire Seux <grego_aur@familleseux.net>

pkgbase=('python-astral')
pkgname=('python-astral')
_module='astral'
pkgver='1.4'
pkgrel=1
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/a4/d6/c309f266677372964c6002a56a7bec2a90875338a71325e20b24d6d1e187/astral-${pkgver}.zip")
md5sums=('140499d213a234cb216e6b7fe36ee3c7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
