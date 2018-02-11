# Maintainer: Gregoire Seux <grego_aur@familleseux.net>

pkgbase=('python-astral')
pkgname=('python-astral')
_module='astral'
pkgver='1.5'
pkgrel=2
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
depends=('python' 'python-pytz')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/17/6f/844ec74588d7edb593c268b30226b0f7f1a26cbcf33d6de8b71676baca03/astral-${pkgver}.tar.gz")
md5sums=('b752fc63b97bdff8e763ce1eb3aa6bd7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
