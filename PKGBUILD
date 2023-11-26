# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=1.6.0
pkgrel=3
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
depends=('libusb')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('cf4514d7254cc111b9d754513da57eef09aa2d91d6a1c3fd7ac4ca800312386c3617657fcdd7671661327cddf310d18c495ace0d447d1947229d9251b3242515')
sha512sums_aarch64=('c19495ec60e202b7a07b7921e6e692ecdf24568e3d0632a7831f5200b0fcf0e7d4eeb3af3a5fb9f519a52999209d986a0e18e15a1a58c415994d69e1666d1462')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 -t "${pkgdir}/usr/bin" cyme

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1/${_pkgname}.1" ${_pkgname}.1
  install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" autocomplete/${_pkgname}.bash
  install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/" autocomplete/_${_pkgname}
}
