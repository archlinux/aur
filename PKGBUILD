# Maintainer: absolom <olivier@make-it.fr>

pkgname=caprover
pkgver=2.3.0
pkgrel=1
pkgdesc='Command Line Interface for CapRover.'
arch=(any)
url=https://github.com/caprover/caprover-cli
license=(Apache)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('dbe3c6cacf0d36d5f7ed676dbda446003b4ef9654d2a2ce7ea3093d81aefb7a68723d830313d348da0c56dc44481b4d096c0c9967a64caafc535ff1e2a7cf7dd')


package() {
  npm i -g --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

  cd "$pkgdir/usr"

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +
}
