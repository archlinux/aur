# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=vscode-langservers-extracted
pkgver=3.0.2
pkgrel=1
pkgdesc="Language servers extracted from VSCode."
url="https://github.com/hrsh7th/vscode-langservers-extracted"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('cbe6e3a821875a94ba7185454f897cdd1be5f931faad99625a067cc0615f33ed')

prepare() {
  tar xf "${pkgname}-${pkgver}.tgz" package/LICENSE
}

package() {
  npm i -g --cache "${srcdir}/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  install -Dm644 package/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
