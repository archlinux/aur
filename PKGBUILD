# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools-bin'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.60.0
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('9ec144ec9e294e28bbc25b644618a6fff82c0b86727773b23155a2d5546f59c8')

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
