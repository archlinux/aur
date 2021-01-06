# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=7.1.2
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
sha512sums=('d51bc9916c106413ead36d3eb855fe8053e62fe3bc7a3500349f4209c7abe7c05aef1d189ef5497e7f126125f7d06e9e77222808a1625a52a85b66512898542b')
noextract=($pkgname-$pkgver.tgz)

package() {
  # Pretend we are a continuous integration tool to force non-interactive install
  export CI=skip
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
