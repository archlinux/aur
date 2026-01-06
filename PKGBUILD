# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=2.2.9
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('cf8306c593c40dcc95b1a6a1602a2702d392a19863f19202e7e26bb0e5e1a0c39a887c49cd3e917719e14164aa9ada97c86f5f77f184710da381305eb14787ab')
sha512sums_aarch64=('3783cd3922dd7a656241ec10c5e1345c6687675128b09e5d6583d8bbfe72df1c23a31821744721494e6655c28b1f4f08331ed9930ab5c22569e38024562aea8f')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
  install -Dm 644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm 644 autocomplete/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" 
  install -Dm 644 autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 autocomplete/${_pkgname}.fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
