# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=mystmd
pkgver=1.7.1
pkgrel=1
pkgdesc="Command line tools for working with MyST Markdown"
url="https://github.com/jupyter-book/${pkgname}"
arch=(any)
license=(MIT)
depends=(nodejs npm)
options=('!emptydirs')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
b2sums=('c1907ffb7db8ebb3519a899d015ca47e545dfa2888657acb5eff9e70668d8c9621f4560eb09d72c57bf9d4eec4d0e2e7d532222b17469ab511e81b761573de45')

package() {
  npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir/usr"
}
