# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thclaws-bin
pkgver=0.158.0
pkgrel=1
pkgdesc="AI agent harness with GUI, CLI, headless and web modes in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/thClaws/thClaws"
license=('Apache-2.0')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'wayland' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/thClaws/thClaws/v${pkgver}/LICENSE-APACHE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/thclaws-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/thclaws-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('c265d0a2ccf456efbcd66e60e8818e545ec98431362bb1abe21d71741db149d7')
sha256sums_x86_64=('3d3b0832ccab5ea6cb3307b71ed74cb683dbcb1e1108e7fe90b14a2492a0d5b0')
sha256sums_aarch64=('1c705ae37c6ddc667985edc0eb09d974ae8fe7be92b1979cbfa7753bfc558803')

package() {
  install -Dm755 "thclaws" "${pkgdir}/usr/bin/thclaws"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
