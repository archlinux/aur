# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=walle
_npmname=@walleproject/cli
pkgver=1.0.5
pkgrel=1
pkgdesc="Terminal EVM wallet with WalletConnect v2 and ERC-20 transfers"
arch=('any')
url="https://github.com/pobepto/walle"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('31b51247d1046f80caf072f3fa942c62466a1c0f5c7159f4026600e3c130767d')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
