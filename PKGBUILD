# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=gamedig
pkgname="nodejs-$_pkgname"
pkgver=5.3.1
pkgrel=1
pkgdesc='A CLI tool for querying the status of nearly any game or voice server'
arch=('any')
url='https://github.com/gamedig/node-gamedig'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$_pkgname-$pkgver.tgz")
sha512sums=('44cfde091f1b00a117fb9740f6cc60e03ea84234b9b7430fb08c46aae7ab04b488bb47f584055a0c60b9f0ba75b2b63017a0350b6c18636a7d3f33ab3d329fe1')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
