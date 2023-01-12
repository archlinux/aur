#
# di - diskinfo
#
# Past maintainer: Eric Bélanger <eric@archlinux.org>
#

pkgname=di
pkgver=4.51
pkgrel=1
pkgdesc="A disk information utility, displaying everything (and more) that your df command does"
arch=('x86_64')
url="https://diskinfo-di.sourceforge.io/"
license=('ZLIB')
depends=('glibc')
source=(https://sourceforge.net/projects/diskinfo-di/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('79b2129c4aff27428695441175940a1717fa0fe2ec2f46d1b886ebb4921461bb')

#
build()
{
  cd ${pkgname}-${pkgver}
  make
}

#
package()
{
  cd ${pkgname}-${pkgver}
  make INSTALL_DIR="${pkgdir}/usr" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

#
# EOF
#
