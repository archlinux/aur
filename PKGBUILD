# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.26.2
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('d649e3f6c918b369f131ff8f282cd78204542e0fc98d31e7a830488243636c30')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm
}

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-client-tools/LICENSE.txt
}
