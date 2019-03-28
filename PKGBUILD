# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=5.3.0
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
sha512sums=('06887814e9aea09db3a2a0f94b6ff5ebc24f48d90ca46e34088ab6bcc7ee37ea65261e8911caee6451205b4060197730f2bc8ea7e90e3cfa5775c235ede8977d')
noextract=($pkgname-$pkgver.tgz)

package() {
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
