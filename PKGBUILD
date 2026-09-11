pkgname=actual-cli
pkgver=26.9.0
pkgrel=1
pkgdesc="CLI for Actual Budget"
arch=('any')
url="https://github.com/actualbudget/actual"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/@actual-app/cli/-/cli-$pkgver.tgz")
noextract=("cli-$pkgver.tgz")
sha256sums=('e7e06b19f6f307a998b9ea7b5b3369342a319628bba6ca5a4604e1868d9ce408')

package() {
  npm install -g --allow-scripts=better-sqlite3 --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/cli-$pkgver.tgz"

  rm -rf "$pkgdir/usr/lib/node_modules/@actual-app/cli/node_modules/.cache"
}
