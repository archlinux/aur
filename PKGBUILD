# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=8.1.5
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
sha512sums=('2149c08732150add612da3243eab9385a45feb0dc516ee767e876999b7e8cc546e2d30e9c96e3cded072930bd70751ac2f66a914cc1098188b05b2896a16f54a')
noextract=($pkgname-$pkgver.tgz)

package() {
  # Pretend we are a continuous integration tool to force non-interactive install
  export CI=skip
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
