# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=3.3.5
pkgrel=1
arch=('x86_64')
_pkgsrc="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgsrc}"
)
sha512sums=('9a832a0a1b3f4a98e073e6625ebcdc1d3699761add4b5b0e54632300dfd5874b9c82e017b097a5347bdda2b7029d08d89340ccfb6dec8c38996f6945ec45860f')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
