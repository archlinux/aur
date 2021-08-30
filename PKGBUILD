# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=2.5.0
pkgrel=1
pkgdesc='Tool for optimizing SVG files'
arch=(any)
url=https://github.com/svg/svgo
license=(MIT)
depends=(nodejs)
makedepends=(npm)
provides=(nodejs-svgo)
replaces=(nodejs-svgo)
conflicts=(nodejs-svgo)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
}

sha256sums=('5fb0056e4581f439cc9ad9738a65766a86b80b834dc931753e39b9277f9749e2')
