# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=gamedig
pkgname="nodejs-$_pkgname"
pkgver=4.3.1
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
sha512sums=('7adf40ab8c250f4704c5710edebdcb5a21048cecec9c6e65ff4612ab36bb1592e826aba7353e8379d9005c075e3aa02a4ad91141a85088f163c7658283848eb6')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
