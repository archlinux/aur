# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=textus-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="Writing environment with documents, AI and plugins side by side"
arch=('x86_64')
url="https://github.com/CatVinci-Studio/Textus"
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/Textus_${pkgver}_linux_x86_64.tar.gz")
sha256sums_x86_64=('d0730e8d05d1ce5f31b56acdc8054d16eb8e87549d03a96b8a264e1faf885cbf')

package() {
  install -Dm755 "Textus/bin/textus" "${pkgdir}/usr/bin/textus"
  install -Dm644 "Textus/share/licenses/textus/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
