# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=port_sentinel-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Find port conflicts and manage processes using ports"
arch=('x86_64')
url="https://github.com/Sanjeever/port_sentinel"
license=('MIT')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Sanjeever/port_sentinel/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/port-sentinel_${pkgver}_linux_amd64.tar.gz")
sha256sums=('26e0d1929275b46d985c28ec5b4885f4e6fc207d0ad9277773d58c4c13df3bba')
sha256sums_x86_64=('d22065dc854138e346418bb5c9a25e1dfe83cd033ad915b59cf11752f82e578a')

package() {
  install -Dm755 "port-sentinel" "${pkgdir}/usr/bin/port-sentinel"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
