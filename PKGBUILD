# Maintainer: Fabien JUIF <fabien.juif@gmail.com>
# This package in inspired from gulp one
pkgname=mocha
pkgver=2.4.5
pkgrel=1
pkgdesc="Simple, flexible, fun JavaScript test framework for node.js and the browser."
arch=('any')
url="https://mochajs.org/"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
md5sums=('cd3a3c6a3757c3540c208709b913b819')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}
