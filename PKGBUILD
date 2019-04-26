# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-server-tools'
pkgdesc='ScaleFT(TM) daemon and shell'
pkgver=1.39.2
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
install=${pkgname}.install
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('4a0331b46018c9ab7990e2e248290f5d302ac4c164502a52035caf7763db451b')

package() {
  install -Dm0644 etc/systemd/system/sftd.service \
                  ${pkgdir}/etc/systemd/system/sftd.service 
  install -Dm0755 usr/sbin/sftd ${pkgdir}/usr/bin/sftd
  install -Dm0644 usr/share/doc/scaleft-server-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-server-tools/LICENSE.txt
}
