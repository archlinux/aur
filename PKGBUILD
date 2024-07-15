# Maintainer: John Whittington <aur {at} jbrengineering {dot} co {dot} uk>
pkgname=cyme-bin
_pkgname=cyme
pkgver=1.8.0
pkgrel=1
pkgdesc="List system USB buses and devices; a modern cross-platform lsusb"
arch=('x86_64' 'aarch64')
url="https://github.com/tuna-f1sh/cyme"
license=('GPL')
depends=('libusb')
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::https://github.com/tuna-f1sh/cyme/releases/download/v${pkgver}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha512sums_x86_64=('e84d310b28d39170db343af9b6c5eadfdcf098950e12eb83c6649a7f97e769064c4c457e800ef6a92cc98e29e1cf63ad2aa0b374f0331c7a4b218556b836462b')
sha512sums_aarch64=('558be1dcb25d64dc19c4bd135f0a6b7dcbfd06ed9f855be54fda4743a4439357b4e243cdbbabfe2d119fbcd462387d4f730255e19a5ff5b278f7ebbca6f1e2f8')

package() {
  cd ${srcdir}/cyme-v${pkgver}-${CARCH}-unknown-linux-gnu

  install -Dm 755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE" 
  install -Dm 644 ${_pkgname}.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -Dm 644 autocomplete/${_pkgname}.bash "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}" 
  install -Dm 644 autocomplete/_${_pkgname} "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm 644 autocomplete/${_pkgname}.fish "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
