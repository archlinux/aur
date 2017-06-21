# Maintainer: crasm <crasm@firebase-tools.aur.yooz4sio.vczf.io>
# PKGBUILD structure copied from grunt-cli package

pkgname=firebase-tools
pkgver=3.9.1
pkgrel=0
pkgdesc="The Firebase Command Line Tools"
arch=('any')
url="https://firebase.google.com/docs/cli/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=('nodejs-firebase-tools')
conflicts=('nodejs-firebase-tools')
replaces=('nodejs-firebase-tools')
install=${pkgname}.install
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('e60e66ae5132817408622823f54f8a611ca459f5eeabd7a2e8f09727add83c5b')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
