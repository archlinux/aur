# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.3
pkgrel=1
arch=('x86_64')
_pkgsrc="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
)
sha512sums=('a35dab1ebcb37be18d5e0c10f3172eec11d51fd887ba67706cf8ad3f1ff380f3c3a458605cf4d27dad514592eaa6fa8e811db3eebe0c49c8967cbee975c84d4c')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
