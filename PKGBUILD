# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=readio-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A terminal ebook reader for EPUB, PDF, Markdown, and plain text with optional local text-to-speech"
arch=('x86_64' 'aarch64')
url="https://github.com/hrhrng/readio"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_tag="tui-v${pkgver}"
_dl="${url}/releases/download/${_tag}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/readio-tui-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/readio-tui-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('7a2198283dd056bf0afdc96c80ec8940ba4025918ae725fcc377e14fdfeede77')
sha256sums_aarch64=('3708b63e9abbe8279b9a81886ebff3258195594d16dd054304a2ea1e3cf7832d')

package() {
  install -Dm755 "readio" "${pkgdir}/usr/bin/readio"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
