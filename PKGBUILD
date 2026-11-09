pkgname=snout-desktop-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Native desktop workbench for Rime input method schemes, models, and themes"
arch=('x86_64')
url="https://github.com/ca-x/snout"
license=('MIT')
depends=('cairo' 'fontconfig' 'glib2' 'glibc' 'graphene' 'gtk4>=4.14' 'harfbuzz' 'libgcc' 'pango')
optdepends=('snout-bin: command-line and terminal interface')
provides=('snout-desktop')
conflicts=('snout-desktop')
options=('!strip' '!debug')
source=("snout-LICENSE-${pkgver}::https://raw.githubusercontent.com/ca-x/snout/v${pkgver}/LICENSE")
source_x86_64=("${url}/releases/download/v${pkgver}/snout-desktop-v${pkgver}-linux-x86_64-gnu.tar.gz")
sha256sums=('7a4b84bc50888e3562c2436ed6acbd6171d92b8e91861934a89b874eba76cfbb')
sha256sums_x86_64=('f273f4e64787487a536429525807f7c68dc33815d641fb130cdc3d944ee9a375')

package() {
  local release_dir="${srcdir}/snout-desktop-v${pkgver}-linux-${CARCH}-gnu"
  install -Dm755 "${release_dir}/bin/snout-desktop" "${pkgdir}/usr/bin/snout-desktop"
  install -Dm644 "${release_dir}/share/applications/io.github.snout.desktop.desktop" \
    "${pkgdir}/usr/share/applications/io.github.snout.desktop.desktop"
  install -Dm644 "${srcdir}/snout-LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
