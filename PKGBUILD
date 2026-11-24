# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=quote-cli
_npmname=quote-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Random quote or quote of the day in the terminal"
arch=('any')
url="https://github.com/riyadhalnur/quote-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/quote-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('daae249e2e7f121dc19a1803e8f7195edb05ddd23f2d0c14600b9d42b8a94a23')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
