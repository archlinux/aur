# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-sabctools
pkgname='python-sabctools'
_name=sabctools
pkgver=7.0.2
pkgrel=1
pkgdesc="implements three main sets of C implementations that are used within SABnzbd"
arch=('any')
url="https://github.com/sabnzbd/sabctools/"
license=(GPL2)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('70299c678c97e937116780b62125e7da343983fe2f21d674dd0b8fcb7fc6a25b2d1b6ad82abd3c6babe93ee3adb4ad4285ae0eb4910dec55241411e7624b98fe')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
