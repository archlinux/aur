# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-sabctools
pkgname='python-sabctools'
_name=sabctools
pkgver=7.1.2
pkgrel=1
pkgdesc="implements three main sets of C implementations that are used within SABnzbd"
arch=('any')
url="https://github.com/sabnzbd/sabctools/"
license=(GPL2)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('5a4672adfa6d476dff34855a25ef2b2ff45beb5072b79be66c53580ca49d0a1f81dcccb6cd7329f507fd5f48c6b67ec71d269dd2610cc011a5befc2f240eb1e5')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
