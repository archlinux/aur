# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=cssmodules-language-server
pkgver=1.3.2
pkgrel=1
pkgdesc="Language server for CSS modules."
url="https://github.com/antonk52/cssmodules-language-server"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('b949aba41afe8d127aac451ab501a6baf6ee0f0db75b7d91aae9f13551dae9da')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
