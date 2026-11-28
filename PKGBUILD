# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=meron-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Email client with chat and kanban views"
arch=('x86_64')
url="https://github.com/nonbili/meron"
license=('AGPL-3.0-only')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'libx11' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nonbili/meron/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/meron-linux-amd64.tar.gz")
sha256sums=('2a090ec3daca676845095889878e14700186d7ed3c5930d6812e8a8bdfedcb98')
sha256sums_x86_64=('9406d1a6b39e6ab7954aff1206dace26f95413adea3ae67605e04910db93c3db')

package() {
  install -Dm755 "meron" "${pkgdir}/usr/bin/meron"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
