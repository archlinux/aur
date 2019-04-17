# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=1.2.2
pkgrel=2
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
  npm install -g --prefix $pkgdir/usr $pkgname-$pkgver.tgz
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('9f8b9728ee4a74a5037a25f7c8f1ec8e1806c767636e2ef3cdba3fe2f0409cd7')
