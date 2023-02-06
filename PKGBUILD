# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Nodejitsu Inc. <info@nodejitsu.com>
# Contributor: indexzero <charlie.robbins@gmail.com>
# Contributor: bradleymeck <bradley.meck@gmail.com>
# Contributor: avianflu <charlie@charlieistheman.com>
# Contributor: mmalecki <me@mmalecki.com>

pkgname=nodejs-forever
_pkg="${pkgname#nodejs-}"
pkgver=4.0.3
pkgrel=1
pkgdesc="Simple CLI tool for running Node scripts continuously"
arch=('any')
url="https://github.com/nodejitsu/forever"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkg/-/$_pkg-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('d8f9391901af92e157a059700d81f1c40dd5f4e7ff792d0102c748a797947a65')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$pkgname-$pkgver.tgz"
  install -dv "$pkgdir/usr/share/licenses/$pkgname/"
  ln -sv "/usr/lib/node_modules/$_pkg/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
