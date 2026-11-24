# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=neovate-code
_npmname=@neovate/code
pkgver=0.28.5
pkgrel=1
pkgdesc="Terminal coding agent"
arch=('x86_64' 'aarch64')
url="https://github.com/neovateai/neovate-code"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/code-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('47df168fe7f6e9031c1d8e0b18dc38440a618c027e4edb94570727836625c7ba')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
