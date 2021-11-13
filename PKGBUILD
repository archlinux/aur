# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=2.8.0
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

sha256sums=('dcd77203a38892630f53e2be29340fad312cae3a83391cd5b9aed2e793ea84f5')
