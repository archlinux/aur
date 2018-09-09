# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-sphinx-automodapi
pkgver=0.7
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/sphinx-automodapi/sphinx-automodapi-${pkgver}.tar.gz")
sha256sums=('684e623d1cbccfb1211496533142c55c860ed9249892b85d0f0461dd32e4e511')

package() {
    cd ${srcdir}/sphinx-automodapi-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
