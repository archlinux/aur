# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=2.2.8
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('ba1aa83e7bf05bce13f67665d1fefb265a21e9e5e510f0f078109f4aba68b3956013cf1913586e9d8ca3cb8659bfa683f9607947639e4b70a1d3a50b3c701e48')
sha512sums_aarch64=('0e5119ab58ed20a4a090d95f1d2cf8088997cbf8446e5d3b6ee59427d4db6fd20011059055b2aa4b9b2ea21dba2969f3930865ce78aa66510c8240a7430f5ad1')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
  install -Dm 644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm 644 autocomplete/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" 
  install -Dm 644 autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 autocomplete/${_pkgname}.fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
