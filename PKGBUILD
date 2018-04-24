_npmname=markserv
pkgname=nodejs-$_npmname
pkgver=0.3.3
pkgrel=1
pkgdesc="Markserv serves Markdown files as GitHub style HTML and LiveReloads your files in the browser as you edit."
arch=(any)
url="https://github.com/f1lt3r/markserv"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('e1d92987f6340372308443831a58811163b548bd9ca5fa40a01627673908546b')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
