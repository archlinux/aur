# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=gamedig
pkgname="nodejs-$_pkgname"
pkgver=5.2.0
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
sha512sums=('60093d2a64276e24e10124976222f62cf7a9a607ed84c8c6f0f2102b850af03bde17f5ffce1c186942aa8bea29d3977488b2e80b3bf1e49d90daf52bf8e57342')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
