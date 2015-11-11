pkgname=morkdown
pkgver=2.4.5
pkgrel=2
pkgdesc="A beautifully simple editor for Markdown documents"
arch=('any')
url="https://github.com/rvagg/morkdown"
license=('MIT +no-false-attribs')
depends=('nodejs' 'chromium')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=($pkgname-$pkgver.tgz)
sha256sums=('dc2758888c3b07e2c8291ef9b817821b12e607bdb3b0e361b314fb190b5d92e8')

package() {
  npm install --unsafe-perm -g --user root --prefix "$pkgdir"/usr "$srcdir"/$pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/etc
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "../../../lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
