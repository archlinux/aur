# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=codexhub-bin
pkgver=0.4.31
pkgrel=1
pkgdesc="Remote-control Codex from Feishu, WeChat or Telegram"
arch=('x86_64')
url="https://github.com/happy-loki/codexhub"
license=('Apache-2.0')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libjpeg-turbo' 'libpng' 'libstdc++' 'libtiff5' 'libx11' 'libxkbcommon' 'pango' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/happy-loki/codexhub/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/CodexHub.Linux.x86_64.tar.gz")
sha256sums=('2f79417897731d0363eb62662e5920b64b2ad2dbe0cddbadf4b680bae7e8e820')
sha256sums_x86_64=('71805c37067482e929cb4a487978e6e749fdeb2cfb5ce556934047aead116884')

package() {
  install -Dm755 "CodexHub Linux x86_64/bin/codexhub" "${pkgdir}/usr/bin/codexhub"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "CodexHub Linux x86_64/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
