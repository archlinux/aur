# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-sphinx-automodapi
pkgver=0.8
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/s/sphinx-automodapi/sphinx-automodapi-${pkgver}.tar.gz")
sha256sums=('247d05ae5597ec86475e7954b788b379190a1ec0ee2f1bc60ae5086a3f29b16a')

package() {
    cd ${srcdir}/sphinx-automodapi-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
