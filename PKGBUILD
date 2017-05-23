# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-client-tools'
pkgdesc='ScaleFT client tools'
pkgver=1.25.3
pkgrel=1
arch=('x86_64')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('glibc')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm")
sha256sums=('1cefc915e29218e1f6629b519e64d56e00c01e49a48c4e5514f5f9450c3dfe14')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.${arch}.rpm
}

package() {
  install -Dm0755 usr/bin/sft ${pkgdir}/usr/bin/sft
  install -Dm0644 usr/share/doc/scaleft-client-tools/LICENSE.txt \
                  ${pkgdir}/share/doc/scaleft-client-tools/LICENSE.txt
}
