# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=cssmodules-language-server
pkgver=1.1.0
pkgrel=1
pkgdesc="Language server for CSS modules."
url="https://github.com/antonk52/cssmodules-language-server"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('55c205d527fbccf51addf6bca4cf069cb0392309af15c98f5a3d719e1d0f308e')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
