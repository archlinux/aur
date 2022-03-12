# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=cssmodules-language-server
pkgver=1.2.1
pkgrel=1
pkgdesc="Language server for CSS modules."
url="https://github.com/antonk52/cssmodules-language-server"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('fda0911503c2891d60dc96132829e683c2bdd5c566ef8747025f331d8a7aeba1')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
