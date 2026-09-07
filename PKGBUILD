# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=gamedig
pkgname="nodejs-$_pkgname"
pkgver=5.3.3
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
sha512sums=('df9cfe8a32269dae53cbce1e7e85570c7058c07d159af70a433c2f65aac2adca6a59eea79fc5f7adb2a52c0b66b751c2ec4bdd3ef044ed58d7266c27fded4af4')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
