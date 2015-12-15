# Maintainer: Raphael Scholer <rascholer@gmail.com>
# Contributor: Matti Pulkkinen (Crashlog) <matti.pulkkinen3 [at] gmail [dot] com>
pkgname=flake8-pep257
pkgver=1.0.5
pkgrel=1
pkgdesc="Flake8 plugin for the pep257 Python utility for validating docstrings."
arch=('any')
url="https://github.com/Robpol86/flake8-pep257"
license=('MIT')
depends=('pep257' 'flake8')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1b61415ec277401d5e7b126ba1662805bc072dda473a34bbcee9592b25d333be')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1

  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=2 sw=2 et:
