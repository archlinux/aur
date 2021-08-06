# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=2.1.2
pkgrel=1
arch=('x86_64')
package="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('51d90ccbfcd21a6fa905d068be9fee5cd91f40c1a04bbe210fbd29bff894b2a641b227025fc6e35cdd7059f2fc9c4cc5043a8f671c9217295b8728ed1bfaec29')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
