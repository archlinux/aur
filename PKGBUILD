# Maintainer: Serge K <arch@phnx47.net>

# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname=cro-chain-maind
pkgname=cro-chain-maind-bin
pkgdesc='Crypto.org Chain desktop wallet'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
pkgver=1.2.0
pkgrel=1
arch=('x86_64')
package="chain-main_${pkgver}_Linux_${arch}.tar.gz"
source=(
  "${package}::${url}/releases/download/v${pkgver}/${package}"
)
sha512sums=('1e6230e50ff8de269902825cb0fcb6f53590b50890144014c40b8f972a0f13455f3a315c5f970751e81465a00bff40f1921bf007f459a830841e06569a963ef4')


package() {
	cd "$srcdir/"
	install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
