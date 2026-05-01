# Maintainer: lex Brinister <fryfrog@gmail.com>
# Contributor: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-sabctools
pkgname='python-sabctools'
_name=sabctools
pkgver=9.4.0
pkgrel=1
pkgdesc="implements three main sets of C implementations that are used within SABnzbd"
arch=('any')
url="https://github.com/sabnzbd/sabctools/"
license=(GPL-2.0-only)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('33640622cc353b8dfce9a63f2aaeee351274be80da1ce829f25198f353fc1dc0de23f271cc326684739c7493096abbc5c2a38411c5784dde5b7ac5bce0773e6f')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
