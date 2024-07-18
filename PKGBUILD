# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-sabctools
pkgname='python-sabctools'
_name=sabctools
pkgver=8.2.4
pkgrel=1
pkgdesc="implements three main sets of C implementations that are used within SABnzbd"
arch=('any')
url="https://github.com/sabnzbd/sabctools/"
license=(GPL-2.0-only)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('99e29fbabe135037ef1c11b84dbf8b6ccc85f5bcb4ddf78fa01eaa638b3c4b2a8c539b25126790207baa73f9b164a7d7bb081c8380cb301978c20d966af17030')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
