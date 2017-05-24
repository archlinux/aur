# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools'
pkgdesc='ScaleFT(TM) client tools'
pkgver=1.25.4
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('1427e58989d646f8f066dd45eda7994c3f05445aa3ce1ec0aaab25e8f14a72d0')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm
}

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-client-tools/LICENSE.txt
}
