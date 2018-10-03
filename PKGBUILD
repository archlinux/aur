# Maintainer: asermax <asermax@gmail.com>
_npm_package=exp
pkgname=exponent-$_npm_package
pkgver=57.2.1
pkgrel=1
pkgdesc='The command-line tool for creating and publishing Expo apps'
arch=(any)
url='https://expo.io'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npm_package/-/$_npm_package-$pkgver.tgz"
        LICENSE)
noextract=($_npm_package-$pkgver.tgz)
md5sums=('52ec7f95eb56ff2f4f0e0d690ea0b8a5'
         'd9f3f23b432f31018852bdc26f020308')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npm_package-$pkgver.tgz
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_npm_package/LICENSE"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
