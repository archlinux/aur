# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=4.0.2
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebook/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('07bf140b513c2f0bdb9af12320fba6297beef7278d4e968aacd55fd07a4fe402661a0abd7dd8a97182ada6a44d0309b4ea5be1a4d84ede3bd1f71791403b26a2')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Fix permissions
  find . -exec chown -h 0:0 {} +
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
