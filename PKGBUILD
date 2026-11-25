# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=thclaws-bin
pkgver=0.157.0
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
sha256sums_x86_64=('5b9f2729e91b38fad47e75c0e224aca9389ce3a7bcf78a1ef47b537aff7694b6')
sha256sums_aarch64=('3de43939433fe08b1083006911c8564e7ee9ee76e8c262695450cece9229eb0a')

package() {
  install -Dm755 "thclaws" "${pkgdir}/usr/bin/thclaws"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
