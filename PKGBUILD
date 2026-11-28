# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=iroh-lan-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Peer-to-peer virtual LAN over iroh, like Hamachi without accounts"
arch=('x86_64')
url="https://github.com/rustonbsd/iroh-lan"
license=('MIT')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/rustonbsd/iroh-lan/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/iroh-lan-ui-linux-x86_64")
sha256sums=('37f019361d6b5ae3e8bc5ea39a123ba54c6ea9f2b71fee75cba42500a6f850a5')
sha256sums_x86_64=('8bc03f21dfdf1a8dce77e9ea377b23833288e7af747d9ed2bbd0d0a5fb976070')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/iroh-lan-ui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
