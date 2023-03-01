# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=1.3.1
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
depends=('libusb')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('6cf8836ad7927d4cff82af0c1c66d1b9bd8125ae049d2375ee644b86d8d24bdfe9360d85dcf23d8a0d537d4fd736071444d2f902b5209dce8ac08b6345433119')
sha512sums_aarch64=('6cf8836ad7927d4cff82af0c1c66d1b9bd8125ae049d2375ee644b86d8d24bdfe9360d85dcf23d8a0d537d4fd736071444d2f902b5209dce8ac08b6345433119')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 -t "${pkgdir}/usr/bin" cyme

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1/${_pkgname}.1" ${_pkgname}.1
  install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" autocomplete/${_pkgname}.bash
  install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}" autocomplete/_${_pkgname}
}
