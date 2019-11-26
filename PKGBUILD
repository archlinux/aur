# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=3.2.0
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebook/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('0566d2ade1cd8596d24ad92f2eb11ea6356e369ee8a0a3a23bb6a6a1ecc464f01a7361f4331061cd421aceda3d393edf66471a44db9b0ee1cac46731aa523044')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
