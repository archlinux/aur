#
# di - diskinfo
#
# Past maintainer: Eric Bélanger <eric@archlinux.org>
#

pkgname=di
pkgver=4.50
pkgrel=1
pkgdesc="A disk information utility, displaying everything (and more) that your df command does"
arch=('x86_64')
url="https://diskinfo-di.sourceforge.io/"
license=('ZLIB')
depends=('glibc')
source=(https://sourceforge.net/projects/diskinfo-di/files/${pkgname}-${pkgver}.tar.gz)
sha256sums=('82f08b6c2549fd6ab2e9cb596135a70883ffd4136d176466ae0ec9ba67a3492a')

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
