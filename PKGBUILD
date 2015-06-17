pkgname=netsukuku
pkgver=0.0.9b
pkgrel=2
pkgdesc="an experimental peer-to-peer routing system"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(bash)
install=netsukuku.install
source=(http://netsukuku.freaknet.org/files/packages/${pkgname}-${pkgver}-i486-9.tgz)

package() {
  cd $srcdir

  # Program 
  install -d -m 755 ${pkgdir}/usr/bin
  install -D -m 755 usr/bin/* ${pkgdir}/usr/bin

  # Conf files
  install -d -m 755 ${pkgdir}/etc/${pkgname}/
  install -D -m 664 etc/${pkgname}/*  ${pkgdir}/etc/${pkgname}/

  #Move the daemon file
  install -d -m 755 ${pkgdir}/etc/rc.d/
  install -D -m 755 ${pkgdir}/etc/${pkgname}/rc.ntk ${pkgdir}/etc/rc.d/ntkd
  rm ${pkgdir}/etc/${pkgname}/rc.ntk

  # Man files
  install -d -m 755 ${pkgdir}/usr/share/man/{man5,man8}
  install -D -m 664 usr/man/man5/* ${pkgdir}/usr/share/man/man5/
  install -D -m 664 usr/man/man8/* ${pkgdir}/usr/share/man/man8/
}
 
md5sums=('1ef4ce3eed387d5e69c6b1a6d2bd036f')

