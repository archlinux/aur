# $Id$
# Maintainer  : Timo Sarawinski <t.sarawinski@gmail.com>
pkgname=openvas-ospd
_pkgname=ospd
pkgver=1.2.0
pkgrel=1
pkgdesc='OpenVAS Scanner Protocol'
url='http://www.openvas.org/'
license=(GPL)
arch=('x86_64')
depends=('python-setuptools' 'python-paramiko' )
groups=(openvas)
# These URLs need to be manually updated on every pkgver upgrade.
# http://wald.intevation.org/frs/?group_id=29
source=("http://wald.intevation.org/frs/download.php/2401/ospd-1.2.0.tar.gz")
sha256sums=('af99f02198e17ae1cbb992bc32b62e60b6fb5b8b99574c984bf563e6acd89424')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --prefix=/usr
}
