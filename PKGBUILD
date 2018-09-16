# Maintainer: asermax <asermax@gmail.com>
_npm_package=exp
pkgname=exponent-$_npm_package
pkgver=57.1.4
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
md5sums=('de6d9be8e3274a44b96f5eb1a4b1db8c'
         'd9f3f23b432f31018852bdc26f020308')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_npm_package-$pkgver.tgz
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_npm_package/LICENSE"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
