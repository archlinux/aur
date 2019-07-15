# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=svgo
pkgver=1.3.0
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
  npm install -g --prefix $pkgdir/usr $pkgname-$pkgver.tgz
  find "${pkgdir}"/usr -name package.json -exec sed -i '/"_where"/d' '{}' '+'
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}

sha256sums=('0f5c978416c4ee460dff15e496b8e5b18b054e47caa32c63fddcdc015e823226')
