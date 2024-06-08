# Maintainer: Chris Lane <aur at chrislane dot com>
_pkgname=gamedig
pkgname="nodejs-$_pkgname"
pkgver=5.0.0
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
sha512sums=('743bf7732e04d20949dcdfa729639961540ef962f1afe1de85b64047e279a977a7bb7d631d6a31c904bc4d4a63147ba14b948229a4eca3198b0f8bf7c4357e89')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_pkgname-$pkgver.tgz"

  install -Dm644 "$pkgdir/usr/lib/node_modules/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
