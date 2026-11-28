# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=md-preview-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="Native, local-first Markdown preview and quick editor"
arch=('x86_64')
url="https://github.com/vorojar/md-preview"
license=('MIT')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'wayland' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/vorojar/md-preview/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/MD-Preview-linux-x64.tar.gz")
sha256sums=('4d7a24db1bcd870e55a5aab935bbe081864c994e2702036c90f5606c9d417979')
sha256sums_x86_64=('13b6cb222f122caf1619e615db49d41ee522677732965ad390ae8e260efc3a30')

package() {
  install -Dm755 "./md-preview" "${pkgdir}/usr/bin/md-preview"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
