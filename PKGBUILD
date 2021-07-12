# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.19.6
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
conflicts=('typescript')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
noextract=("assemblyscript-$pkgver.tgz")
sha256sums=('8d6a34430d10c1a2c088aea1cfcaf0b33935b55bf8cd1f4c5595210680cec4a3')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
