# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=8.0.2
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
sha512sums=('9c12e51c4f1011d5c7a1aec909d712d38e841623b05019b6b7fa995621dceaebbd243c6f6a19c72f18daf0ed6a5ba53603669330b00413b73781fe3fcc06ceae')
noextract=($pkgname-$pkgver.tgz)

package() {
  # Pretend we are a continuous integration tool to force non-interactive install
  export CI=skip
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
