# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mystmd
pkgver=1.9.1
pkgrel=1
pkgdesc="Command line tools for working with MyST Markdown"
url="https://github.com/jupyter-book/${pkgname}"
arch=(any)
license=(MIT)
depends=(nodejs npm)
options=('!emptydirs')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('c6a4c9325adce5b29bb1b1e6b11d03d019867ca9133ef270f0b2589ecf77b814e46b601ea2c6a5be8c9ed50800c36f9448d8d649aa93c14d9f5adb8c53e5d462')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
