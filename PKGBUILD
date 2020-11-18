# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.50.3
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('d9559bdbca5e430c8810f9ba70d09d2e5a75228d91d93fe7eb3db96845cd261e')

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-server-tools/LICENSE.txt
}
