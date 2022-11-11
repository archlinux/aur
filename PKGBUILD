# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools-bin'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.64.3
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname%-*}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('7604f533f8858dd10806c6a8179fb3dac3a20dbfcc3774011ca37d7eefff576a')

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
