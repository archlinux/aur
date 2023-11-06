# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=8.6.1
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
sha512sums=('a23d81cfcde82910a18140ad51f18292c9be4137a83254b524ab2f95a6b4c284b737c58bca65e214abca9ecf75bbce6f9c9b60b03c041ddc311ce5d6e6b74748')
noextract=($pkgname-$pkgver.tgz)

package() {
  # Pretend we are a continuous integration tool to force non-interactive install
  export CI=skip
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
