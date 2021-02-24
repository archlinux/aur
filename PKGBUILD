# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=2.1.0
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

sha256sums=('01cb574e694dca6e9c3386251601b6792fd3ef99f8f6ce3468b9a8587ad77be1')
