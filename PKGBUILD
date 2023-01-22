# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=http-server
pkgname=nodejs-$_npmname
pkgver=14.1.1
pkgrel=1
pkgdesc='A simple zero-configuration command-line http server'
arch=('any')
url='https://github.com/http-party/http-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('9e1ceb265d09a4d86dcf509cb4ba6dcd2e03254b1d13030198766fe3897fd7a5')
noextract=("$_npmname-$pkgver.tgz")

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "${pkgdir}"
}
