# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mystmd
pkgver=1.9.0
pkgrel=1
pkgdesc="Command line tools for working with MyST Markdown"
url="https://github.com/jupyter-book/${pkgname}"
arch=(any)
license=(MIT)
depends=(nodejs npm)
options=('!emptydirs')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('1232f6e5a2f1979116cbe2562198006f952d5694d89e5c35f38f208426710a15640d3a2dd4225d36fd78c1b39598f2c8afc6a589ecc1628860499a2a82d6e002')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
