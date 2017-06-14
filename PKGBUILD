# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.27.1
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('0a97765c150acd70f13784f483b3d8865a7c5e4021792d200081f942ce48984f')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm
}

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-client-tools/LICENSE.txt
}
