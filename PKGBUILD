# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=2.2.1
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
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  find "$pkgdir" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
  chown -R root:root "${pkgdir}"
}

sha256sums=('b6f577742ab0bbd7a120ff93411fe88e56752e8b9c90e6d8d582b042c5470e67')
