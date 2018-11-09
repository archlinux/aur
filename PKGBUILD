# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-sphinx-automodapi
pkgver=0.9
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/sphinx-automodapi/sphinx-automodapi-${pkgver}.tar.gz")
sha256sums=('71a69e1a7ab8d849f416d7431db854d7b1925f749ba6345bc7d88f288892871d')

package() {
    cd ${srcdir}/sphinx-automodapi-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
