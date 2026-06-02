# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.28.18
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
noextract=("assemblyscript-$pkgver.tgz")
sha256sums=('ed0af6753f2413f1a14234b94b57de18e2f29d4563e0db7e23d9e8c5cc4162d4')


package() {
  npm install -g --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
