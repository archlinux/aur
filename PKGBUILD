# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=2.0.1
pkgrel=1
arch=('x86_64')
package="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('4e91df9a5d038e381d5a655700cd03210f8e3246eabc988c344d67642eb23d123cd37d83757c9c6078e7d2006fb0895e4ce350c791363377d23bb464736f30b1')


package() {
  cd "$srcdir/"
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
