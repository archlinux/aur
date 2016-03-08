# Contributor: Jonathan Ryan <jryan@curious-computing.com>
# Contributor: Hussam Al-Tayeb <hussam@visp.net.lb>
pkgname=htpdate
pkgver=1.1.3
pkgrel=1
pkgdesc="A client for time synchronisation"
arch=(i686 x86_64)
url="http://www.vervest.org/htp/"
license=(GPL2)
depends=('glibc')
source=("http://www.vervest.org/htp/archive/c/${pkgname}-${pkgver}.tar.xz" "htpdate.service")
md5sums=('51fcfe05fc4f8be6b19ecbaf88e8deaa'
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

