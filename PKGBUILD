# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.27.28
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
conflicts=('typescript')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
noextract=("assemblyscript-$pkgver.tgz")
sha256sums=('4548f33131e45179b4c2b89af0011f98ce8bd7bbe918ef6e34ee9e152fa6413f')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
