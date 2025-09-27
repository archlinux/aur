# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=2.2.6
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('ed4375c3c8e61aa3c38c53a0cc321b1eb39292b3713e7ae5336e18a84c461a173a7405b09f4e4ed925319e8469a8f387c17cf5976e021cac155a89f83519ec7e')
sha512sums_aarch64=('81ce31dd6c4375e4a3ecba3fcddcc07d432345f230ca44d290a69a410b24c7761bf2a7bb0448c4b185e88a36664666c50d0168cb403e42edc7168a2a7a8455a9')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
  install -Dm 644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm 644 autocomplete/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" 
  install -Dm 644 autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 autocomplete/${_pkgname}.fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
