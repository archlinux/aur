# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=1.4.0
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
depends=('libusb')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('80fb9106ad82e3ad44af9003e5fdf71d9b700d263e3d161d8f13e76f5f0ca8733a5e0e360f2474c03d7e99268b354ccc2f83411309a31e08fcdb6b9e0591d851')
sha512sums_aarch64=('80fb9106ad82e3ad44af9003e5fdf71d9b700d263e3d161d8f13e76f5f0ca8733a5e0e360f2474c03d7e99268b354ccc2f83411309a31e08fcdb6b9e0591d851')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 -t "${pkgdir}/usr/bin" cyme

  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${_pkgname}/" LICENSE
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1/${_pkgname}.1" ${_pkgname}.1
  install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" autocomplete/${_pkgname}.bash
  install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}" autocomplete/_${_pkgname}
}
