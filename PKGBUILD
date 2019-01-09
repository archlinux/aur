# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-sphinx-automodapi
_pyname=${pkgname#python-}
pkgver=0.10
pkgrel=1
pkgdesc="Sphinx extension for generating API documentation."
arch=('any')
url="https://sphinx-automodapi.readthedocs.io/en/latest/"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha256sums=('5c989bfe37f555f635e8fbb650859df391556981f5a436507fb3241794fd26c6')

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
