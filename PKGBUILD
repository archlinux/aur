# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: mustafagonul <mustafagonul@gmail..com>

pkgname=create-react-app
pkgver=3.1.1
pkgrel=1
pkgdesc='Bootstrapping tool for React'
arch=(any)
url=https://github.com/facebookincubator/create-react-app
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('11a2b9f6023012c4998e320de0cc86d0391771ab45ddc11760e0c81fbac3ae552b7a66fb8b08b94736461884a63c8adfcb02c2f364289bff025e24fc8708b13d')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

  cd "$pkgdir"/usr

  # Remove world-writeable bits
  find . -type d -exec chmod 755 {} +

  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
