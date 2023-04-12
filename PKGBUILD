# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Former Maintainer: Jean Lucas <jean@4ray.co>

pkgname=nativescript
pkgver=8.5.3
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
sha512sums=('8eb13a3e81418314eecbacbb3e41836b0ef33bc7680eaf0001a4ba77fd3dd343694ac8c2f64e6ac23ce6f986372df8c69a55de048f446f8cfb892f0ca3a4fd4b')
noextract=($pkgname-$pkgver.tgz)

package() {
  # Pretend we are a continuous integration tool to force non-interactive install
  export CI=skip
  npm install -g --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
