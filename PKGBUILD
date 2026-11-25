# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=open-oscar-server-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Self-hostable instant messaging server compatible with classic AIM and ICQ clients written in golang"
arch=('x86_64')
url="https://github.com/mk6i/open-oscar-server"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/open_oscar_server.${pkgver}.linux.x86_64.tar.gz")
sha256sums_x86_64=('35d0f9bbab43761769b2d789485bdae25892acc0d1f2c8f3cf6361f28d0081ea')

package() {
  install -Dm755 "open_oscar_server.${pkgver}.linux.x86_64/open_oscar_server" "${pkgdir}/usr/bin/open_oscar_server"
  install -Dm644 "open_oscar_server.${pkgver}.linux.x86_64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
