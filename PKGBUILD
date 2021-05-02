# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools-bin'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.52.2
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('fa1f49ff4d0dfe652b6b05a76b02ee0767daeee5db785104ac15886607eaa138')

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
