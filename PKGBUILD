# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=python-lib389
pkgname=('python-lib389' 'python2-lib389')
pkgver=1.0.4
pkgrel=3
pkgdesc="389 Directory Server Python library."
arch=('any')
url='https://port389.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://fedorapeople.org/groups/389ds//binaries/python-lib389-${pkgver}.tar.bz2")
sha256sums=('6b22fd9277adebd595e30ac614741d21f8df91d4e9e303c3c5fa3044609060bb')

package_python-lib389() {
  depends=('python-ldap')
  pkgdesc="389 Directory Server Python library. (python3 version)"

  cd "${srcdir}/python-lib389-${pkgver}"
  python setup.py install --root=${pkgdir} 
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

package_python2-lib389() {
  depends=('python2-ldap')
  pkgdesc="389 Directory Server Python library. (python2 version)"

  cd "${srcdir}/python-lib389-${pkgver}"
  python2 setup.py install --root=${pkgdir} 
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim:set ts=2 sw=2 et:
