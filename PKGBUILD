# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.2
pkgrel=1
arch=('x86_64')
_pkgsrc="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
)
sha512sums=('59af09bdf406666d4fc92734cf1350115c37ec6facc6b21a913c861b8201d4515368de60237d5892f159b28adba7a0797cf2569245ad54a2e5220244278a285a')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
