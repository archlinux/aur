# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=confluence-cli
_npmname=confluence-cli
pkgver=2.31.3
pkgrel=1
pkgdesc="Command-line interface for Atlassian Confluence"
arch=('any')
url="https://github.com/pchuri/confluence-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/confluence-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('7c21ecb065b8685b5146a17365fa7b8060fd02740b029051ae8f4d622ec0cc65')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
