# Maintainer: Charims <charims@gmail.com>
pkgname=opencode-cursor-auth
pkgver=1.0.16
pkgrel=1
pkgdesc="Cursor Auth Plugin for opencode"
arch=('any')
url="https://github.com/POSO-PocketSolutions/opencode-cursor-auth"
license=('ISC')
depends=('opencode' 'npm')
options=('!strip' '!debug')
conflicts=("${pkgname}-debug")
install=$pkgname.install


source=("$pkgname-$pkgver.tar.gz::https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('91b07e997ef82a3456c8a118104d5bf1024e7a920ff924fbc0f3b51a7cdd7ae5')

package() {
  depends=('opencode' 'cursor-cli')
  cd "$srcdir/package"
  npm install
  mkdir -p "$pkgdir/usr/lib/opencode/plugins/$pkgname"
  cp -r . "$pkgdir/usr/lib/opencode/plugins/$pkgname"
}
