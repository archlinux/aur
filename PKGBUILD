# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=spive2d-bin
pkgver=0.1.65
pkgrel=1
pkgdesc="Simple Spine and Live2D viewer"
arch=('x86_64')
url="https://github.com/lmmtrr/spive2d"
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/lmmtrr/spive2d/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/spive2d_linux_x64")
sha256sums=('4754d4563318ebc537c98652331d7832b64cad539ed0be9e27154b1fb6ba5e0c')
sha256sums_x86_64=('9c1a931d9f7e7fd496d50ebb5d60f04ad1f7406aded10aff7d2da1dccb9a6ca0')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/spive2d"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
