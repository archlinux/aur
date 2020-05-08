# Maintainer: absolom <olivier@make-it.fr>

pkgname=caprover
pkgver=2.1.1
pkgrel=1
pkgdesc='Command Line Interface for CapRover.'
arch=(any)
url=https://github.com/caprover/caprover-cli
license=(Apache)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('9c7349bb80197a8fe57954a515117d0bd8b7f0ccf5d06d376659ef22c951de3b63319252a71a0d2c84aec22017639fc7a2626c8a2c576605e22b3cd0306ed474')


package() {
  npm i -g --prefix "$pkgdir/usr" $pkgname-$pkgver.tgz

  cd "$pkgdir/usr"

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +
}
