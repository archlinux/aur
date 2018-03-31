# Maintainer: Gregoire Seux <grego_aur@familleseux.net>

pkgbase=('python-astral')
pkgname=('python-astral')
_module='astral'
pkgver='1.6'
pkgrel=0
pkgdesc="Calculations for the position of the sun and moon."
url="https://github.com/sffjunkie/astral"
depends=('python' 'python-pytz')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/52/10/e9fbc6f7c9f8cc411003a3fd3e3df75de79447a8b965ae96272d526fba28/astral-${pkgver}.tar.gz")
sha256sums=('874b397ddbf0a4c1d8d644b21c2481e8a96b61343f820ad52d8a322d61a15083')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
