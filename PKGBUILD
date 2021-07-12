# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=2.1.1
pkgrel=1
arch=('x86_64')
package="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('65c4b3eb9c287b8dd507476fb0d9f51d567d9887f9fc2335c99cf4b389c1a2e49463649dfc2b74c613f39273fb58150fb18bae9f3427ae3b243251a25e165833')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
