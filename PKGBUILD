# Contributor: Jonathan Ryan <jryan@curious-computing.com>
# Contributor: Hussam Al-Tayeb <hussam@visp.net.lb>
pkgname=htpdate
pkgver=1.1.1
pkgrel=1
pkgdesc="A client for time synchronisation"
arch=(i686 x86_64)
url="http://www.vervest.org/htp/"
license=(GPL2)
depends=('glibc')
source=("http://www.vervest.org/htp/archive/c/${pkgname}-${pkgver}.tar.xz" "htpdate.service")
md5sums=('c612f63282e3f23b709f37a5c81d4739'
         'b419153625904d9a5544e585f69c66c5')
build() {
  cd ${pkgname}-${pkgver}
  make
}
package() {
  install -D -m 644 htpdate.service ${pkgdir}/usr/lib/systemd/system/htpdate.service
  cd ${pkgname}-${pkgver}
  install -D -m 755 htpdate ${pkgdir}/usr/bin/htpdate
  install -D -m 644 htpdate.8 ${pkgdir}/usr/share/man/man8/htpdate.8
}

