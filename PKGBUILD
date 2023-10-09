# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=1.5.0
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
depends=('libusb')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('4ed4e541935fe2d91d1fa4f36f5ca984b1e144fc419c3a5bf6db83ff7773e9c6f702c84bea6e8e8d1e0fec0f50045042575d1c463c1c2d7f7047eb28bc02cbbd')
sha512sums_aarch64=('4ed4e541935fe2d91d1fa4f36f5ca984b1e144fc419c3a5bf6db83ff7773e9c6f702c84bea6e8e8d1e0fec0f50045042575d1c463c1c2d7f7047eb28bc02cbbd')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 -t "${pkgdir}/usr/bin" cyme

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1/${_pkgname}.1" ${_pkgname}.1
  install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" autocomplete/${_pkgname}.bash
  install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}" autocomplete/_${_pkgname}
}
