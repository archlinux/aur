# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-sphinx-automodapi
_pyname=${pkgname#python-}
pkgver=0.11
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('4f61015db8c9a65809a41b1f609d827c99dc2c7b0179aedc4f64fc7d7aeec9e7')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
