# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mystmd
pkgver=1.8.0
pkgrel=1
pkgdesc="Command line tools for working with MyST Markdown"
url="https://github.com/jupyter-book/${pkgname}"
arch=(any)
license=(MIT)
depends=(nodejs npm)
options=('!emptydirs')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('664577ec1bb83db39c5f5729786c41917ac90929b06ad557362ece651be0edcf8441e462761a34505926bdc9da8a4ab9bdf9602d127510e362024b2eb7e6275a')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
