# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=6.2.1
pkgrel=1
pkgdesc='CLI for building NativeScript apps'
arch=(any)
url=https://www.npmjs.com/package/nativescript
license=(Apache)
depends=(nodejs)
makedepends=(npm)
optdepents=(android-sdk: for native Android development)
conflicts=(nativescript-cli)
options=(!emptydirs)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
sha512sums=('f7a659e97813155879973f224858432ff0671fa1c7d3c79970fa96eed1475a6323e5628a7f8ff2a3a7471a33b6ca6719cfc872372d39efed582f9f5b1e4bfeb9')
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
