# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mystmd
pkgver=1.7.0
pkgrel=1
pkgdesc="Command line tools for working with MyST Markdown"
url="https://github.com/jupyter-book/${pkgname}"
arch=(any)
license=(MIT)
depends=(nodejs npm)
options=('!emptydirs')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('dedd3ead691fdcab173986a78d6345897b6166d4af4fe68571ff110030efd59919756c809ad57216bc5cdcb0a163b7713fbe54fa6126fb209a669b413da4069a')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
