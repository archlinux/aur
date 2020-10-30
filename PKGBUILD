# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=4.0.0
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebook/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('4e89c9ede3ad09ba9445f13c55a1ca5c73efb0530daf26bed1764cbe9180890f129e58a0ef405f662d0252bd0c34cf164316a9d717b71a2bed28e070b90b110a')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
