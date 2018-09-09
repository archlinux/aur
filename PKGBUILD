# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Chris Severance aur.severach AatT spamgourmet.com

pkgname=python-astropy-sphinx-theme
pkgver=1.0
pkgrel=1
pkgdesc="The sphinx theme for Astropy and affiliated packages."
arch=('any')
url="https://github.com/astropy/astropy-sphinx-theme"
license=('BSD')
depends=('python-sphinx>=1.6')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/a/astropy-sphinx-theme/astropy-sphinx-theme-${pkgver}.tar.gz")
sha256sums=('f7e5734bca4bfd62769b2516f2b80a3dc9f950ef67066706579a086d2b2162bc')

package() {
    cd ${srcdir}/astropy-sphinx-theme-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
