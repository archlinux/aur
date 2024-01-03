# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>

pkgbase=python-sabctools
pkgname='python-sabctools'
_name=sabctools
pkgver=8.1.0
pkgrel=1
pkgdesc="implements three main sets of C implementations that are used within SABnzbd"
arch=('any')
url="https://github.com/sabnzbd/sabctools/"
license=(GPL2)
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('1652f0c8034c4238281b6e1b83fbd4c98b7520ae7e919e51809f870ecc0cd9cc349dbefb200459046b819904700ebd0161ac557758d7b6dc5275a425a9fd2396')

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
