# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=3.0.0
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('0046ef0aab20be5b209f896e17697770861c79208eb06cb03a72f0d148770edb09a8e316d70d5e9101cc1127546e5f96e93f01dae016147ff37c743ce214c837')
sha512sums_aarch64=('967c82895575c4f56f730d816541487bb80ab640067d33044571f1f1a0ba6efe1ead1f8017e508967abf5b387a444c0d3f47e86786d4627164bfd9ffed62f3d0')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
  install -Dm 644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm 644 autocomplete/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" 
  install -Dm 644 autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 autocomplete/${_pkgname}.fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
