# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=dzgui-bin
pkgver=7.0.0b31
pkgrel=1
pkgdesc="DayZ server browser and mod manager"
arch=('x86_64')
url="https://github.com/aclist/dzgui"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/dzgui-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('259e290deccbb3d94da05528bdedaa0c5a9e60d6163484d6d481e5511f7f40fa')

package() {
  install -Dm755 "dzgui/dzgui" "${pkgdir}/usr/bin/dzgui"
  install -Dm644 "dzgui/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
